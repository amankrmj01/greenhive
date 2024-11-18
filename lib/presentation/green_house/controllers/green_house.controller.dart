import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as GetX;
import 'package:get/get_core/src/get_main.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../../models/Greenhouse.dart';
import '../../../models/Microcontroller.dart';
import '../../widgets/snackbar_c.dart';

class GreenHouseController extends GetX.GetxController {
  ScrollController scrollController = ScrollController();
  final hide = false.obs;

  // Observable variables for sensor data
  final temperature = 'Loading...'.obs;
  final humidity = 'Loading...'.obs;
  final soilMoisture = 'Loading...'.obs;
  final light = 'Loading...'.obs;

  // Observable variables for device control statuses
  final fanStatus = 'OFF'.obs;
  final lightStatus = 'OFF'.obs;
  final waterPumpStatus = 'OFF'.obs;

  // Observable variable for microcontroller status
  final isActive = false.obs;
  bool hasCheckedStatus = false;

  // Boolean variables to control snackbar display
  bool isUpdatingStatusSnackbarShown = false;
  bool isErrorSnackbarShown = false;

  late Greenhouse greenhouse;
  MqttServerClient? mqttClient;
  Timer? _statusCheckTimer;
  DateTime? _lastMessageReceivedTime;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
    greenhouse = GetX.Get.arguments as Greenhouse;
    _setupMqttClient();
    _startStatusCheckTimer();
  }

  @override
  void onClose() {
    _statusCheckTimer?.cancel();
    super.onClose();
  }

  void hideFxn() {
    hide.value = scrollController.position.pixels > 180;
  }

  void _setupMqttClient() async {
    mqttClient = MqttServerClient.withPort(
        dotenv.env['MQTT_ENDPOINT']!, dotenv.env['CLIENT_ID']!, 8883);
    mqttClient!.secure = true;
    mqttClient!.setProtocolV311();
    mqttClient!.logging(on: true);

    // Create a security context
    final context = SecurityContext.defaultContext;

    // Load certificate and key files as strings, then encode to bytes
    final rootPemData =
        await rootBundle.loadString(dotenv.env['ROOT_CA_PATH']!);
    final certData = await rootBundle.loadString(dotenv.env['CERT_PATH']!);
    final privateKeyData =
        await rootBundle.loadString(dotenv.env['PRIVATE_KEY_PATH']!);

    // Set certificates and private key using byte arrays
    context.setTrustedCertificatesBytes(utf8.encode(rootPemData));
    context.useCertificateChainBytes(utf8.encode(certData));
    context.usePrivateKeyBytes(utf8.encode(privateKeyData));

    // Assign the security context to the MQTT client
    mqttClient!.securityContext = context;

    // Set up connection message
    final connMessage = MqttConnectMessage()
        .withClientIdentifier(dotenv.env['CLIENT_ID']!)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    mqttClient!.connectionMessage = connMessage;

    // Attempt to connect
    try {
      await mqttClient!.connect();
      safePrint("MQTT connected successfully.");

      // Subscribe to a topic
      mqttClient!.subscribe(dotenv.env['SUBSCRIBE_TOPIC']!, MqttQos.atMostOnce);

      // Set up a listener for incoming messages
      mqttClient!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
        final String message =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        safePrint('Received message: $message from topic: ${c[0].topic}');
        _lastMessageReceivedTime = DateTime.now();
        _updateGreenhouseDataFromMqtt(message);
      });
    } catch (e) {
      safePrint("MQTT Connection error: $e");
      _markMicrocontrollerInactive();
    }
  }

  void _updateGreenhouseDataFromMqtt(String message) {
    try {
      final data = jsonDecode(message);
      temperature.value = data['temperature'].toString();
      humidity.value = data['humidity'].toString();
      soilMoisture.value = data['soilMoisture'].toString();
      light.value = data['actualLightIntensity'].toString();
      _markMicrocontrollerActive();
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Failed to update data from MQTT message: $e',
          backgroundColor: Colors.red);
    }
  }

  void _startStatusCheckTimer() {
    _statusCheckTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_lastMessageReceivedTime == null ||
          DateTime.now().difference(_lastMessageReceivedTime!).inSeconds > 10) {
        _markMicrocontrollerInactive();
      }
    });
  }

  void _markMicrocontrollerActive() {
    if (!isActive.value) {
      isActive.value = true;
      SnackbarHelper.showCustomSnackbar('Info', 'Microcontroller is active.',
          backgroundColor: Colors.green);
    }
  }

  void _markMicrocontrollerInactive() {
    if (isActive.value) {
      isActive.value = false;
      SnackbarHelper.showCustomSnackbar('Info', 'Microcontroller is inactive.',
          backgroundColor: Colors.red);
    }
  }

  Future<void> updateDeviceStatus(String value, String deviceType) async {
    try {
      String mqttPayloadKey;
      String mqttPayloadValue;

      switch (deviceType) {
        case 'waterPump':
          waterPumpStatus.value = value;
          mqttPayloadKey = "wps";
          mqttPayloadValue = value == "ON" ? "1" : "0";
          if (value == "ON") {
            turnOffWaterPumpAfterDelay();
          }
          break;
        case 'light':
          lightStatus.value = value;
          mqttPayloadKey = "ls";
          mqttPayloadValue = value == "ON" ? "1" : "0";
          break;
        case 'roof':
          fanStatus.value = value;
          mqttPayloadKey = "fc";
          mqttPayloadValue = value == "ON" ? "1" : "0";
          break;
        default:
          throw Exception('Invalid device type');
      }

      final mqttPayload = {mqttPayloadKey: mqttPayloadValue};

      final builder = MqttClientPayloadBuilder();
      builder.addString(jsonEncode(mqttPayload));

      mqttClient!.publishMessage(
          dotenv.env['PUBLISH_TOPIC']!, MqttQos.atMostOnce, builder.payload!);
      SnackbarHelper.showCustomSnackbar('Info', 'Published: $mqttPayload',
          backgroundColor: Colors.blue);
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Failed to publish MQTT message: $e',
          backgroundColor: Colors.red);
    }
  }

  void turnOffWaterPumpAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      updateDeviceStatus("OFF", "waterPump");
    });
  }

  void sendAllValuesToZero() {
    try {
      // Set all statuses to OFF
      waterPumpStatus.value = "OFF";
      lightStatus.value = "OFF";
      fanStatus.value = "OFF";

      // Construct the MQTT payload
      final mqttPayload = {"wps": "0", "ls": "0", "fs": "0"};

      final builder = MqttClientPayloadBuilder();
      builder.addString(jsonEncode(mqttPayload));

      // Publish the message
      mqttClient!.publishMessage(
          dotenv.env['PUBLISH_TOPIC']!, MqttQos.atMostOnce, builder.payload!);
      SnackbarHelper.showCustomSnackbar('Info', 'Published: $mqttPayload',
          backgroundColor: Colors.blue);
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Failed to publish MQTT message: $e',
          backgroundColor: Colors.red);
    }
  }

  Future<void> deleteCurrentMicrocontrollerAndGreenhouse() async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      // Fetch the current microcontroller
      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);
      final microcontrollerRequest = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final microcontrollerResponse =
          await Amplify.API.query(request: microcontrollerRequest).response;

      final microcontroller = microcontrollerResponse.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      // Delete the microcontroller
      final deleteMicrocontrollerRequest =
          ModelMutations.delete<Microcontroller>(microcontroller);
      await Amplify.API.mutate(request: deleteMicrocontrollerRequest).response;

      // Fetch the current greenhouse
      final greenhouseIdentifier =
          GreenhouseModelIdentifier(greenhouseId: greenhouse.greenhouseId);
      final greenhouseRequest =
          ModelQueries.get(Greenhouse.classType, greenhouseIdentifier);
      final greenhouseResponse =
          await Amplify.API.query(request: greenhouseRequest).response;

      final greenhouseData = greenhouseResponse.data;
      if (greenhouseData == null) {
        throw Exception('Greenhouse not found');
      }

      // Delete the greenhouse
      final deleteGreenhouseRequest =
          ModelMutations.delete<Greenhouse>(greenhouseData);
      await Amplify.API.mutate(request: deleteGreenhouseRequest).response;

      SnackbarHelper.showCustomSnackbar(
          'Info', 'Deleted microcontroller and greenhouse successfully',
          backgroundColor: Colors.blue);
      Get.back();
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Failed to delete microcontroller and greenhouse: $e',
          backgroundColor: Colors.red);
    }
  }
}

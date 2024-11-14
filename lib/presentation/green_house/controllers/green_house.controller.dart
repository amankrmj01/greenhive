import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as GetX;
import 'package:greenhive/models/MicrocontrollerFanStatus.dart';
import 'package:greenhive/models/MicrocontrollerLightStatus.dart';
import 'package:greenhive/models/MicrocontrollerWaterPumpStatus.dart';
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
  Timer? _timer;

  MqttServerClient? mqttClient;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
    greenhouse = GetX.Get.arguments as Greenhouse;
    _setupMqttClient();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void hideFxn() {
    hide.value = scrollController.position.pixels > 180;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchLatestSensorData();
    });
  }

  Future<void> fetchLatestSensorData() async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);
      final request = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final response = await Amplify.API.query(request: request).response;

      final microcontroller = response.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      _updateGreenhouseData(microcontroller);
      _checkMicrocontrollerStatus(microcontroller.updatedAt);
    } catch (e) {
      if (!isErrorSnackbarShown) {
        isErrorSnackbarShown = true;
        SnackbarHelper.showCustomSnackbar(
            'Error', 'Failed to fetch latest sensor data: $e',
            backgroundColor: Colors.red);
      }
    }
  }

  void _updateGreenhouseData(Microcontroller updatedMicrocontroller) {
    if (!isUpdatingStatusSnackbarShown) {
      isUpdatingStatusSnackbarShown = true;
      SnackbarHelper.showCustomSnackbar('Info', 'Updating statuses...',
          backgroundColor: Colors.blue);
    }

    temperature.value = updatedMicrocontroller.temperature.toString();
    humidity.value = updatedMicrocontroller.humidity.toString();
    soilMoisture.value = updatedMicrocontroller.soilMoisture.toString();
    light.value = updatedMicrocontroller.actualLightIntensity.toString();
    fanStatus.value =
        updatedMicrocontroller.fanStatus!.toString().split('.')[1];
    lightStatus.value =
        updatedMicrocontroller.lightStatus!.toString().split('.')[1];
    waterPumpStatus.value =
        updatedMicrocontroller.waterPumpStatus!.toString().split('.')[1];
  }

  void _checkMicrocontrollerStatus(TemporalDateTime? updatedAt) {
    if (updatedAt == null) {
      if (!hasCheckedStatus || isActive.value) {
        isActive.value = false;
        hasCheckedStatus = true;
        SnackbarHelper.showCustomSnackbar(
            'Info', 'Microcontroller is inactive.',
            backgroundColor: Colors.red);
      }
      return;
    }

    DateTime updatedAtTime = updatedAt.getDateTimeInUtc();
    DateTime currentTime = DateTime.now().toUtc();

    Duration difference = currentTime.difference(updatedAtTime);

    if (difference.inMinutes <= 5) {
      if (!hasCheckedStatus || !isActive.value) {
        isActive.value = true;
        hasCheckedStatus = true;
        SnackbarHelper.showCustomSnackbar('Info', 'Microcontroller is active.',
            backgroundColor: Colors.green);
      }
    } else {
      if (!hasCheckedStatus || isActive.value) {
        isActive.value = false;
        hasCheckedStatus = true;
        SnackbarHelper.showCustomSnackbar(
            'Info', 'Microcontroller is inactive.',
            backgroundColor: Colors.red);
      }
    }
  }

  // Future<void> updateDeviceStatus(String value, String deviceType) async {
  //   await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
  //   try {
  //     String microcontrollerId = greenhouse.greenhouseId;
  //
  //     if (microcontrollerId.isEmpty) {
  //       throw Exception('Microcontroller ID is empty');
  //     }
  //
  //     final microcontrollerIdentifier =
  //         MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);
  //     final request = ModelQueries.get(
  //         Microcontroller.classType, microcontrollerIdentifier);
  //     final response = await Amplify.API.query(request: request).response;
  //
  //     final microcontroller = response.data;
  //     if (microcontroller == null) {
  //       throw Exception('Microcontroller not found');
  //     }
  //
  //     Microcontroller updatedMicrocontroller;
  //     switch (deviceType) {
  //       case 'fan':
  //         updatedMicrocontroller =
  //             microcontroller.copyWith(fanStatus: _getFanStatusEnum(value));
  //         break;
  //       case 'light':
  //         updatedMicrocontroller =
  //             microcontroller.copyWith(lightStatus: _getLightStatusEnum(value));
  //         break;
  //       case 'waterPump':
  //         updatedMicrocontroller = microcontroller.copyWith(
  //             waterPumpStatus: _getWaterPumpStatusEnum(value));
  //         break;
  //       default:
  //         throw Exception('Invalid device type');
  //     }
  //
  //     final updateRequest =
  //         ModelMutations.update<Microcontroller>(updatedMicrocontroller);
  //     final updateResponse =
  //         await Amplify.API.mutate(request: updateRequest).response;
  //
  //     SnackbarHelper.showCustomSnackbar('Info', 'Response: $updateResponse',
  //         backgroundColor: Colors.blue);
  //   } catch (e) {
  //     SnackbarHelper.showCustomSnackbar(
  //         'Error', 'Failed to update $deviceType status: $e',
  //         backgroundColor: Colors.red);
  //   }
  // }

  MicrocontrollerFanStatus _getFanStatusEnum(String value) {
    switch (value) {
      case 'ON':
        return MicrocontrollerFanStatus.ON;
      case 'OFF':
        return MicrocontrollerFanStatus.OFF;
      case 'AUTO':
        return MicrocontrollerFanStatus.AUTO;
      default:
        throw Exception('Invalid fan status value');
    }
  }

  MicrocontrollerLightStatus _getLightStatusEnum(String value) {
    switch (value) {
      case 'ON':
        return MicrocontrollerLightStatus.ON;
      case 'OFF':
        return MicrocontrollerLightStatus.OFF;
      case 'AUTO':
        return MicrocontrollerLightStatus.AUTO;
      default:
        throw Exception('Invalid light status value');
    }
  }

  MicrocontrollerWaterPumpStatus _getWaterPumpStatusEnum(String value) {
    switch (value) {
      case 'ON':
        return MicrocontrollerWaterPumpStatus.ON;
      case 'OFF':
        return MicrocontrollerWaterPumpStatus.OFF;
      case 'AUTO':
        return MicrocontrollerWaterPumpStatus.AUTO;
      default:
        throw Exception('Invalid water pump status value');
    }
  }

  Future<void> _waitForSpecificSecond(List<int> seconds) async {
    while (!seconds.contains(DateTime.now().second)) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void _setupMqttClient() {
    mqttClient = MqttServerClient.withPort(
        dotenv.env['MQTT_ENDPOINT']!, dotenv.env['CLIENT_ID']!, 8883);
    mqttClient!.secure = true;
    mqttClient!.setProtocolV311();
    mqttClient!.logging(on: true);

    final context = SecurityContext.defaultContext;
    context.setTrustedCertificates(dotenv.env['ROOT_CA_PATH']!);
    context.useCertificateChain(dotenv.env['CERT_PATH']!);
    context.usePrivateKey(dotenv.env['PRIVATE_KEY_PATH']!);

    mqttClient!.securityContext = context;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier(dotenv.env['CLIENT_ID']!)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    mqttClient!.connectionMessage = connMessage;

    mqttClient!.connect();
  }

  Future<void> updateDeviceStatus(String value, String deviceType) async {
    await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
    try {
      String waterPumpStatus = this.waterPumpStatus.value;
      String lightStatus = this.lightStatus.value;
      String fanStatus = this.fanStatus.value;

      if (deviceType == 'waterPump') {
        waterPumpStatus = value;
      } else if (deviceType == 'light') {
        lightStatus = value;
      } else if (deviceType == 'fan') {
        fanStatus = value;
      }

      final mqttPayload = {
        "wps": waterPumpStatus == "ON" ? "1" : "0",
        "ls": lightStatus == "ON" ? "1" : "0",
        "fs": fanStatus == "ON" ? "1" : "0"
      };

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
}

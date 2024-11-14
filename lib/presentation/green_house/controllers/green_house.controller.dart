import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as GetX;
import 'package:greenhive/models/MicrocontrollerFanStatus.dart';
import 'package:greenhive/models/MicrocontrollerLightStatus.dart';
import 'package:greenhive/models/MicrocontrollerWaterPumpStatus.dart';

import '../../../models/Greenhouse.dart';
import '../../../models/Microcontroller.dart';

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

  late Greenhouse greenhouse;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
    greenhouse = GetX.Get.arguments as Greenhouse;
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void hideFxn() {
    if (scrollController.position.pixels > 180) {
      hide.value = true;
    } else {
      hide.value = false;
    }
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
    } catch (e) {
      safePrint('Failed to fetch latest sensor data: $e');
    }
  }

  void _updateGreenhouseData(Microcontroller updatedMicrocontroller) {
    safePrint("Updating statuses:");

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

  Future<void> updateDeviceStatus(String value, String deviceType) async {
    await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
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

      var updatedMicrocontroller;
      switch (deviceType) {
        case 'fan':
          updatedMicrocontroller =
              microcontroller.copyWith(fanStatus: _getFanStatusEnum(value));
          break;
        case 'light':
          updatedMicrocontroller =
              microcontroller.copyWith(lightStatus: _getLightStatusEnum(value));
          break;
        case 'waterPump':
          updatedMicrocontroller = microcontroller.copyWith(
              waterPumpStatus: _getWaterPumpStatusEnum(value));
          break;
        default:
          throw Exception('Invalid device type');
      }

      final updateRequest =
          ModelMutations.update<Microcontroller>(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');
    } catch (e) {
      safePrint('Failed to update $deviceType status: $e');
      GetX.Get.snackbar(
          'Error', 'Failed to update $deviceType. Please try again.');
    }
  }

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
}

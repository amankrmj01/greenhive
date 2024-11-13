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
  final co2 = 'Loading...'.obs;
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
      int currentSecond = DateTime.now().second;
      if ([5, 15, 25, 35, 45, 55].contains(currentSecond)) {
        fetchLatestSensorData();
      }
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

  void _updateGreenhouseData(Microcontroller? updatedMicrocontroller) {
    if (updatedMicrocontroller == null) {
      safePrint("Microcontroller is null");
      return;
    }

    safePrint("Updating statuses:");

    temperature.value = updatedMicrocontroller.temperature.toString();
    humidity.value = updatedMicrocontroller.humidity.toString();
    co2.value = updatedMicrocontroller.co2.toString();
    light.value = updatedMicrocontroller.lightLevel.toString();
    fanStatus.value =
        updatedMicrocontroller.fanStatus!.toString().split('.')[1];
    lightStatus.value =
        updatedMicrocontroller.lightStatus!.toString().split('.')[1];
    waterPumpStatus.value =
        updatedMicrocontroller.waterPumpStatus!.toString().split('.')[1];
  }

  Future<void> updateFanStatus(String value) async {
    await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
    // Rest of the function
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

      MicrocontrollerFanStatus? fanStatusEnum;
      switch (value) {
        case 'ON':
          fanStatusEnum = MicrocontrollerFanStatus.ON;
          break;
        case 'OFF':
          fanStatusEnum = MicrocontrollerFanStatus.OFF;
          break;
        case 'AUTO':
          fanStatusEnum = MicrocontrollerFanStatus.AUTO;
          break;
        default:
          throw Exception('Invalid fan status value');
      }
      await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
      final updatedMicrocontroller =
          microcontroller.copyWith(fanStatus: fanStatusEnum);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');
    } catch (e) {
      safePrint('Failed to update Fan status: $e');
      GetX.Get.snackbar('Error', 'Failed to update Fan. Please try again.');
    }
  }

  Future<void> updateLightStatus(String value) async {
    // Rest of the function
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

      MicrocontrollerLightStatus? lightStatusEnum;
      switch (value) {
        case 'ON':
          lightStatusEnum = MicrocontrollerLightStatus.ON;
          break;
        case 'OFF':
          lightStatusEnum = MicrocontrollerLightStatus.OFF;
          break;
        case 'AUTO':
          lightStatusEnum = MicrocontrollerLightStatus.AUTO;
          break;
        default:
          throw Exception('Invalid light status value');
      }
      await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
      final updatedMicrocontroller =
          microcontroller.copyWith(lightStatus: lightStatusEnum);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');
    } catch (e) {
      safePrint('Failed to update Light status: $e');
      GetX.Get.snackbar('Error', 'Failed to update Light. Please try again.');
    }
  }

  Future<void> updateWaterPumpStatus(String value) async {
    // Rest of the function
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

      MicrocontrollerWaterPumpStatus? waterPumpStatusEnum;
      switch (value) {
        case 'ON':
          waterPumpStatusEnum = MicrocontrollerWaterPumpStatus.ON;
          break;
        case 'OFF':
          waterPumpStatusEnum = MicrocontrollerWaterPumpStatus.OFF;
          break;
        case 'AUTO':
          waterPumpStatusEnum = MicrocontrollerWaterPumpStatus.AUTO;
          break;
        default:
          throw Exception('Invalid water pump status value');
      }

      final updatedMicrocontroller =
          microcontroller.copyWith(waterPumpStatus: waterPumpStatusEnum);
      await _waitForSpecificSecond([2, 12, 22, 32, 42, 52]);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');
    } catch (e) {
      safePrint('Failed to update Water Pump status: $e');
      GetX.Get.snackbar(
          'Error', 'Failed to update Water Pump. Please try again.');
    }
  }

  Future<void> _waitForSpecificSecond(List<int> seconds) async {
    while (!seconds.contains(DateTime.now().second)) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}

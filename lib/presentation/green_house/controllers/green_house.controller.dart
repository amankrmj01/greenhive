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
  StreamSubscription<GraphQLResponse<Microcontroller>>?
      microcontrollerSubscription;

  late Greenhouse greenhouse;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
    greenhouse = GetX.Get.arguments as Greenhouse;
    fetchLatestSensorData();
    // Start subscription after getting the greenhouse data
    subscribeToMicrocontroller();
  }

  @override
  void onClose() {
    microcontrollerSubscription?.cancel();
    safePrint('Subscription cancelled');
    super.onClose();
  }

  void hideFxn() {
    if (scrollController.position.pixels > 180) {
      hide.value = true;
    } else {
      hide.value = false;
    }
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

  Future<void> subscribeToMicrocontroller() async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        GetX.Get.snackbar(
            'Error', 'Microcontroller not found for this greenhouse.');
        return;
      }

      final subscriptionRequest = ModelSubscriptions.onUpdate(
        Microcontroller.classType,
        where: Microcontroller.MICROCONTROLLERID.eq(microcontrollerId),
      );

      microcontrollerSubscription = Amplify.API
          .subscribe(
        subscriptionRequest,
        onEstablished: () => safePrint('Subscription established'),
      )
          .listen((event) {
        safePrint('Subscription event data received');
        _updateGreenhouseData(event.data);
      }, onError: (Object e) {
        safePrint('Error in subscription stream: $e');
      });
    } on ApiException catch (e) {
      debugPrint('Error subscribing to microcontroller: $e');
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

  // Fetch latest sensor data
  // Future<void> subscribeToMicrocontroller() async {
  //   try {
  //     String microcontrollerId =
  //         greenhouse.greenhouseId; // Use optional chaining
  //
  //     if (microcontrollerId.isEmpty) {
  //       GetX.Get.snackbar(
  //           'Error', 'Microcontroller not found for this greenhouse.');
  //       return;
  //     }
  //
  //     final subscriptionRequest = ModelSubscriptions.onUpdate(
  //       Microcontroller.classType,
  //       where: Microcontroller.MICROCONTROLLERID.eq(microcontrollerId),
  //     );
  //
  //     microcontrollerSubscription = Amplify.API
  //         .subscribe(
  //       subscriptionRequest,
  //       onEstablished: () => safePrint('Subscription established'),
  //     )
  //         .listen((event) {
  //       safePrint('Subscription event data received');
  //       _updateGreenhouseData(event.data);
  //     }, onError: (Object e) {
  //       safePrint('Error in subscription stream: $e');
  //     });
  //   } on ApiException catch (e) {
  //     debugPrint('Error subscribing to microcontroller: $e');
  //   }
  // }
  //
  // void _updateGreenhouseData(Microcontroller? updatedMicrocontroller) {
  //   if (updatedMicrocontroller == null) return;
  //
  //   safePrint("Updating statuses:");
  //
  //   temperature.value = updatedMicrocontroller.temperature.toString();
  //   humidity.value = updatedMicrocontroller.humidity.toString();
  //   co2.value = updatedMicrocontroller.co2.toString();
  //   light.value = updatedMicrocontroller.lightLevel.toString();
  //   fanStatus.value =
  //       updatedMicrocontroller.fanStatus!.toString().split('.')[1];
  //   lightStatus.value =
  //       updatedMicrocontroller.lightStatus!.toString().split('.')[1];
  //   waterPumpStatus.value =
  //       updatedMicrocontroller.waterPumpStatus!.toString().split('.')[1];
  // }

  Future<void> updateFanStatus(String value) async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      // Create a ModelIdentifier using the microcontrollerId
      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);

      // Fetch the microcontroller using the microcontrollerIdentifier
      final request = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final response = await Amplify.API.query(request: request).response;

      final microcontroller = response.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      // Convert the string value to the corresponding enum value
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

      // Update the microcontroller with the new fan status
      final updatedMicrocontroller =
          microcontroller.copyWith(fanStatus: fanStatusEnum);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');

      // Update the UI state after successful API call
      // fanStatus.value = value;
    } catch (e) {
      safePrint('Failed to update Fan status: $e');
      GetX.Get.snackbar('Error', 'Failed to update Fan. Please try again.');
    }
  }

  Future<void> updateLightStatus(String value) async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      // Create a ModelIdentifier using the microcontrollerId
      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);

      // Fetch the microcontroller using the microcontrollerIdentifier
      final request = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final response = await Amplify.API.query(request: request).response;

      final microcontroller = response.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      // Convert the string value to the corresponding enum value
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

      // Update the microcontroller with the new light status
      final updatedMicrocontroller =
          microcontroller.copyWith(lightStatus: lightStatusEnum);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');

      // Update the UI state after successful API call
      // lightStatus.value = value;
    } catch (e) {
      safePrint('Failed to update Light status: $e');
      GetX.Get.snackbar('Error', 'Failed to update Light. Please try again.');
    }
  }

  Future<void> updateWaterPumpStatus(String value) async {
    try {
      String microcontrollerId = greenhouse.greenhouseId;

      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      // Create a ModelIdentifier using the microcontrollerId
      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);

      // Fetch the microcontroller using the microcontrollerIdentifier
      final request = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final response = await Amplify.API.query(request: request).response;

      final microcontroller = response.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      // Convert the string value to the corresponding enum value
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

      // Update the microcontroller with the new water pump status
      final updatedMicrocontroller =
          microcontroller.copyWith(waterPumpStatus: waterPumpStatusEnum);
      final updateRequest = ModelMutations.update(updatedMicrocontroller);
      final updateResponse =
          await Amplify.API.mutate(request: updateRequest).response;

      safePrint('Response: $updateResponse');

      // Update the UI state after successful API call
      // waterPumpStatus.value = value;
    } catch (e) {
      safePrint('Failed to update Water Pump status: $e');
      GetX.Get.snackbar(
          'Error', 'Failed to update Water Pump. Please try again.');
    }
  }
}

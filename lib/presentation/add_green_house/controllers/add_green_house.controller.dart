import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/ModelProvider.dart';

class AddGreenHouseController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController microcontrollerIdController;
  late TextEditingController cropNameController;
  late TextEditingController cropTimePeriodController;
  RxBool isActive = true.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    microcontrollerIdController = TextEditingController();
    cropNameController = TextEditingController();
    cropTimePeriodController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    microcontrollerIdController.dispose();
    cropNameController.dispose();
    cropTimePeriodController.dispose();
    super.onClose();
  }

  Future<void> saveGreenhouse() async {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Info', 'Form validation successful.',
          backgroundColor: Colors.blue, colorText: Colors.white);
      try {
        final user = await Amplify.Auth.getCurrentUser();
        final userId = user.userId;

        // 1. Query for existing Microcontroller
        final microcontrollerListResponse = await Amplify.API
            .query(
              request: ModelQueries.list(Microcontroller.classType,
                  where: Microcontroller.MICROCONTROLLERID
                      .eq(microcontrollerIdController.text)),
            )
            .response;

        if (microcontrollerListResponse.hasErrors) {
          Get.snackbar('Error',
              'Error fetching microcontroller: ${microcontrollerListResponse.errors}',
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }

        final microcontrollerList =
            microcontrollerListResponse.data?.items ?? [];
        Microcontroller? microcontroller;

        if (microcontrollerList.isNotEmpty) {
          microcontroller = microcontrollerList.first;
          Get.snackbar('Info', 'Microcontroller found.',
              backgroundColor: Colors.blue, colorText: Colors.white);
        } else {
          // 2. Create Microcontroller if not found
          microcontroller = Microcontroller(
            microcontrollerId: microcontrollerIdController.text,
            timestamp: TemporalTimestamp(DateTime.now()),
            temperature: 0.0,
            humidity: 0.0,
            co2: 0.0,
            lightLevel: 0.0,
            soilMoisture: 0.0,
            modelRecommendation: '',
            actualFanSpeed: 0.0,
            actualLightIntensity: 0.0,
            fanStatus: MicrocontrollerFanStatus.OFF,
            fanSpeedSetting: 0,
            lightStatus: MicrocontrollerLightStatus.OFF,
            lightIntensitySetting: 0,
            waterPumpStatus: MicrocontrollerWaterPumpStatus.OFF,
          );

          final microcontrollerResponse = await Amplify.API
              .mutate(request: ModelMutations.create(microcontroller))
              .response;

          if (microcontrollerResponse.hasErrors) {
            Get.snackbar('Error',
                'Error creating microcontroller: ${microcontrollerResponse.errors}',
                backgroundColor: Colors.red, colorText: Colors.white);
            return;
          }
          microcontroller = microcontrollerResponse.data;
          Get.snackbar('Success', 'Created new microcontroller.',
              backgroundColor: Colors.green, colorText: Colors.white);
        }

        // 3. Create Greenhouse
        final newGreenhouse = Greenhouse(
          name: nameController.text,
          cropName: cropNameController.text,
          cropTimePeriod: int.parse(cropTimePeriodController.text),
          isActive: isActive.value,
          greenhouseId: microcontroller!.microcontrollerId,
          user: User(userId: userId),
        );

        final greenhouseResponse = await Amplify.API
            .mutate(request: ModelMutations.create(newGreenhouse))
            .response;

        if (greenhouseResponse.hasErrors) {
          Get.snackbar('Error',
              'Error creating greenhouse: ${greenhouseResponse.errors}',
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }

        Greenhouse createdGreenhouse = greenhouseResponse.data!;

        // 4. Update User
        final userResponse = await Amplify.API
            .query(
                request: ModelQueries.get(
                    User.classType, UserModelIdentifier(userId: userId)))
            .response;

        if (userResponse.hasErrors) {
          Get.snackbar('Error', 'Error fetching user: ${userResponse.errors}',
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }

        User existingUser;
        if (userResponse.data == null) {
          // User does not exist, create a new user
          existingUser = User(
            userId: userId,
            greenhouses: [createdGreenhouse],
          );

          final createUserResponse = await Amplify.API
              .mutate(request: ModelMutations.create(existingUser))
              .response;

          if (createUserResponse.hasErrors) {
            Get.snackbar(
                'Error', 'Error creating user: ${createUserResponse.errors}',
                backgroundColor: Colors.red, colorText: Colors.white);
            return;
          }
          Get.snackbar('Success', 'New user created.',
              backgroundColor: Colors.green, colorText: Colors.white);
        } else {
          // User exists, update the user
          existingUser = userResponse.data!;
          final updatedGreenhouses =
              (existingUser.greenhouses ?? []) + [createdGreenhouse];
          final updatedUser =
              existingUser.copyWith(greenhouses: updatedGreenhouses);

          final updateUserResponse = await Amplify.API
              .mutate(request: ModelMutations.update(updatedUser))
              .response;

          if (updateUserResponse.hasErrors) {
            Get.snackbar(
                'Error', 'Error updating user: ${updateUserResponse.errors}',
                backgroundColor: Colors.red, colorText: Colors.white);
            return;
          }
          Get.snackbar('Success', 'User updated.',
              backgroundColor: Colors.green, colorText: Colors.white);
        }

        // 5. Navigation and success message
        Get.back();
        Get.snackbar('Success', 'Greenhouse added successfully!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } catch (e) {
        Get.snackbar('Error', 'Unexpected error: $e',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error', 'Form validation failed.',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}

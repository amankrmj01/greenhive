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

  // Future<void> saveGreenhouse() async {
  //   if (formKey.currentState!.validate()) {
  //     safePrint('Form validation successful.');
  //     try {
  //       // Fetch current authenticated user
  //       final user = await Amplify.Auth.getCurrentUser();
  //       final userId = user.userId;
  //       safePrint('Fetched authenticated user with userId: $userId');
  //
  //       // Check if the microcontroller exists via API query
  //       safePrint(
  //           'Checking if microcontroller exists with ID: ${microcontrollerIdController.text}');
  //       final microcontrollerListResponse = await Amplify.API
  //           .query(
  //             request: ModelQueries.list(
  //               Microcontroller.classType,
  //               where: Microcontroller.DEVICEID
  //                   .eq(microcontrollerIdController.text),
  //             ),
  //           )
  //           .response;
  //
  //       if (microcontrollerListResponse.hasErrors) {
  //         safePrint(
  //             'Error checking for existing microcontroller: ${microcontrollerListResponse.errors}');
  //         Get.snackbar(
  //             'Error', 'Failed to check microcontroller. Please try again.',
  //             snackPosition: SnackPosition.BOTTOM);
  //         return;
  //       }
  //
  //       final microcontrollerList =
  //           microcontrollerListResponse.data?.items ?? [];
  //       final microcontroller =
  //           microcontrollerList.isNotEmpty ? microcontrollerList.first : null;
  //       safePrint(microcontroller != null
  //           ? 'Microcontroller found: ${microcontroller.deviceId}'
  //           : 'No microcontroller found with that ID.');
  //
  //       // Create the Greenhouse object with the foreign key (userId)
  //       final newGreenhouse = Greenhouse(
  //         name: nameController.text,
  //         cropName: cropNameController.text,
  //         cropTimePeriod: int.parse(cropTimePeriodController.text),
  //         isActive: isActive.value,
  //         greenhouseId: userId, // Link to User model
  //       );
  //       safePrint('Created Greenhouse object: ${newGreenhouse.toString()}');
  //
  //       // Save the new Greenhouse with API.mutate
  //       final greenhouseRequest = ModelMutations.create(newGreenhouse);
  //       final greenhouseResponse =
  //           await Amplify.API.mutate(request: greenhouseRequest).response;
  //
  //       if (greenhouseResponse.hasErrors) {
  //         safePrint('Error saving greenhouse: ${greenhouseResponse.errors}');
  //         Get.snackbar('Error', 'Failed to save greenhouse. Please try again.',
  //             snackPosition: SnackPosition.BOTTOM);
  //         return;
  //       }
  //       safePrint('Greenhouse saved successfully.');
  //
  //       // If Microcontroller doesn't exist, create and link it to the new Greenhouse
  //       if (microcontroller == null) {
  //         final newMicrocontroller = Microcontroller(
  //           deviceId: microcontrollerIdController.text,
  //           microcontrollerId:
  //               newGreenhouse.greenhouseId, // Link to new Greenhouse
  //         );
  //         safePrint(
  //             'Creating new Microcontroller: ${newMicrocontroller.toString()}');
  //
  //         final microcontrollerRequest =
  //             ModelMutations.create(newMicrocontroller);
  //         final microcontrollerResponse = await Amplify.API
  //             .mutate(request: microcontrollerRequest)
  //             .response;
  //
  //         if (microcontrollerResponse.hasErrors) {
  //           safePrint(
  //               'Error creating new microcontroller: ${microcontrollerResponse.errors}');
  //           Get.snackbar(
  //               'Error', 'Failed to create microcontroller. Please try again.',
  //               snackPosition: SnackPosition.BOTTOM);
  //           return;
  //         }
  //         safePrint(
  //             'New microcontroller created and linked to the greenhouse.');
  //       } else {
  //         safePrint('Using existing microcontroller linked to the greenhouse.');
  //       }
  //
  //       // Navigate back and show success message
  //       Get.back();
  //       safePrint('Navigating back to previous screen.');
  //       Get.snackbar('Success', 'Greenhouse added!',
  //           snackPosition: SnackPosition.BOTTOM);
  //     } catch (e) {
  //       safePrint('Unexpected error saving greenhouse: $e');
  //       Get.snackbar('Error', 'Failed to add greenhouse. Please try again.',
  //           snackPosition: SnackPosition.BOTTOM);
  //     }
  //   } else {
  //     safePrint('Form validation failed.');
  //   }
  // }
  Future<void> saveGreenhouse() async {
    if (formKey.currentState!.validate()) {
      safePrint('Form validation successful.');
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
          // ... (Error handling for microcontroller query)
          safePrint(
              'Error fetching microcontroller: ${microcontrollerListResponse.errors}');
          return;
        }

        final microcontrollerList =
            microcontrollerListResponse.data?.items ?? [];
        Microcontroller? microcontroller;

        if (microcontrollerList.isNotEmpty) {
          microcontroller = microcontrollerList.first;
          safePrint('Microcontroller found.');
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
            // Empty JSON
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
            // Handle Microcontroller creation errors
            safePrint(
                'Error creating microcontroller: ${microcontrollerResponse.errors}');
            return;
          }
          microcontroller = microcontrollerResponse.data;
          safePrint('Created new microcontroller.');
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
          // Handle errors
          safePrint('Error creating greenhouse: ${greenhouseResponse.errors}');
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
          // Handle error
          safePrint('Error fetching user: ${userResponse.errors}');
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
            // Handle error
            safePrint('Error creating user: ${createUserResponse.errors}');
            return;
          }
          safePrint('New user created.');
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
            // Handle error
            safePrint('Error updating user: ${updateUserResponse.errors}');
            return;
          }
          safePrint('User updated.');
        }

        // 5. Navigation and success message
        Get.back();
        Get.snackbar('Success', 'Greenhouse added successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        safePrint('Unexpected error: $e'); // Keep this for general errors
        Get.snackbar('Error', 'Failed to add greenhouse. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      safePrint('Form validation failed.');
    }
  }
}

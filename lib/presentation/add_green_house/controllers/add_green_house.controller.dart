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
      safePrint('Form validation successful.');
      try {
        // Fetch current authenticated user
        final user = await Amplify.Auth.getCurrentUser();
        final userId = user.userId;
        safePrint('Fetched authenticated user with userId: $userId');

        // Check if the microcontroller exists via API query
        safePrint(
            'Checking if microcontroller exists with ID: ${microcontrollerIdController.text}');
        final microcontrollerListResponse = await Amplify.API
            .query(
              request: ModelQueries.list(
                Microcontroller.classType,
                where: Microcontroller.DEVICEID
                    .eq(microcontrollerIdController.text),
              ),
            )
            .response;

        if (microcontrollerListResponse.hasErrors) {
          safePrint(
              'Error checking for existing microcontroller: ${microcontrollerListResponse.errors}');
          Get.snackbar(
              'Error', 'Failed to check microcontroller. Please try again.',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }

        final microcontrollerList =
            microcontrollerListResponse.data?.items ?? [];
        final microcontroller =
            microcontrollerList.isNotEmpty ? microcontrollerList.first : null;
        safePrint(microcontroller != null
            ? 'Microcontroller found: ${microcontroller.deviceId}'
            : 'No microcontroller found with that ID.');

        // Create the Greenhouse object with the foreign key (userId)
        final newGreenhouse = Greenhouse(
          name: nameController.text,
          cropName: cropNameController.text,
          cropTimePeriod: int.parse(cropTimePeriodController.text),
          isActive: isActive.value,
          greenhouseId: userId, // Link to User model
        );
        safePrint('Created Greenhouse object: ${newGreenhouse.toString()}');

        // Save the new Greenhouse with API.mutate
        final greenhouseRequest = ModelMutations.create(newGreenhouse);
        final greenhouseResponse =
            await Amplify.API.mutate(request: greenhouseRequest).response;

        if (greenhouseResponse.hasErrors) {
          safePrint('Error saving greenhouse: ${greenhouseResponse.errors}');
          Get.snackbar('Error', 'Failed to save greenhouse. Please try again.',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }
        safePrint('Greenhouse saved successfully.');

        // If Microcontroller doesn't exist, create and link it to the new Greenhouse
        if (microcontroller == null) {
          final newMicrocontroller = Microcontroller(
            deviceId: microcontrollerIdController.text,
            microcontrollerId:
                newGreenhouse.greenhouseId, // Link to new Greenhouse
          );
          safePrint(
              'Creating new Microcontroller: ${newMicrocontroller.toString()}');

          final microcontrollerRequest =
              ModelMutations.create(newMicrocontroller);
          final microcontrollerResponse = await Amplify.API
              .mutate(request: microcontrollerRequest)
              .response;

          if (microcontrollerResponse.hasErrors) {
            safePrint(
                'Error creating new microcontroller: ${microcontrollerResponse.errors}');
            Get.snackbar(
                'Error', 'Failed to create microcontroller. Please try again.',
                snackPosition: SnackPosition.BOTTOM);
            return;
          }
          safePrint(
              'New microcontroller created and linked to the greenhouse.');
        } else {
          safePrint('Using existing microcontroller linked to the greenhouse.');
        }

        // Navigate back and show success message
        Get.back();
        safePrint('Navigating back to previous screen.');
        Get.snackbar('Success', 'Greenhouse added!',
            snackPosition: SnackPosition.BOTTOM);
      } catch (e) {
        safePrint('Unexpected error saving greenhouse: $e');
        Get.snackbar('Error', 'Failed to add greenhouse. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      safePrint('Form validation failed.');
    }
  }
}

import 'dart:io';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/ModelProvider.dart';
import '../../widgets/snackbar_c.dart';

class AddGreenHouseController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController microcontrollerIdController;
  late TextEditingController cropNameController;
  late TextEditingController cropTimePeriodController;
  late TextEditingController pubController;
  late TextEditingController subController;

  String certificate = '';
  String privateKey = '';
  String rootCa = '';

  var certPath = ''.obs;
  var privateKeyPath = ''.obs;
  var rootCaPath = ''.obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    cropNameController = TextEditingController();
    cropTimePeriodController = TextEditingController();
    microcontrollerIdController = TextEditingController();
    pubController = TextEditingController();
    subController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    cropNameController.dispose();
    cropTimePeriodController.dispose();
    pubController.dispose();
    subController.dispose();
    super.onClose();
  }

  Future<void> readCertificateFiles() async {
    try {
      certificate = await File(certPath.value).readAsString();
      privateKey = await File(privateKeyPath.value).readAsString();
      rootCa = await File(rootCaPath.value).readAsString();
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Failed to read certificate files: $e');
      safePrint('Failed to read certificate files: $e');
    }
  }

  Future<void> saveGreenhouse() async {
    if (!formKey.currentState!.validate()) {
      SnackbarHelper.showCustomSnackbar('Fill all fields', '',
          backgroundColor: Colors.red);
      return;
    }

    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final user = await Amplify.Auth.getCurrentUser();

      // Create Greenhouse
      final greenhouse = Greenhouse(
        name: nameController.text,
        description: descriptionController.text,
        cropType: cropNameController.text,
        cropTimePeriod: int.parse(cropTimePeriodController.text),
        greenhouseId: user.userId,
      );
      final greenhouseResponse = await Amplify.API
          .mutate(request: ModelMutations.create(greenhouse))
          .response;

      final createdGreenhouse =
          greenhouseResponse.data; // Ensure greenhouse is created successfully

      if (createdGreenhouse == null) {
        throw Exception('Failed to create Greenhouse');
      }

      // Create Microcontroller linked to the Greenhouse
      final microcontroller = Microcontroller(
        microcontrollerId: user.userId,
        microcontrollerName: microcontrollerIdController.text,
        publishTopic: pubController.text,
        subscribeTopic: subController.text,
        certificate: certificate,
        privateKey: privateKey,
        rootCA: rootCa,
      );
      await Amplify.API
          .mutate(request: ModelMutations.create(microcontroller))
          .response;

      SnackbarHelper.showCustomSnackbar(
          'Success', 'Greenhouse and Microcontroller added successfully!',
          backgroundColor: Colors.green);
    } catch (e) {
      SnackbarHelper.showCustomSnackbar('Error', 'Unexpected error: $e',
          backgroundColor: Colors.red);
    } finally {
      Get.back(); // Dismiss dialog
    }
  }
}

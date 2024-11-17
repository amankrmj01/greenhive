import 'package:get_it/get_it.dart';
import 'package:greenhive/infrastructure/dal/services/aws/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';
import '../../widgets/snackbar_c.dart';

class SignInController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final otpCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final SignInService signInService = GetIt.instance<SignInService>();

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
    otpCode.dispose();
  }

  Future<void> signInUser(String username, String password) async {
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final isSignedIn = await signInService.signInUser(
        username: username,
        password: password,
      );

      // Dismiss loading dialog
      Get.back();

      if (isSignedIn) {
        SnackbarHelper.showCustomSnackbar('Success', 'Signed in successfully',
            backgroundColor: Colors.green);
        Future.delayed(
            const Duration(seconds: 2), () => Get.offAllNamed(Routes.HOME));
      } else {
        SnackbarHelper.showCustomSnackbar('Error', 'Failed to sign in',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      // Dismiss loading dialog
      Get.back();

      SnackbarHelper.showCustomSnackbar(
          'Failed to sign in', 'Incorrect username or password',
          backgroundColor: Colors.red);
    }
  }
}

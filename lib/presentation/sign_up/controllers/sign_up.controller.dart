import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../infrastructure/dal/services/aws/sign_up_service.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../widgets/snackbar_c.dart';

class SignUpController extends GetxController {
  final fullName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();

  final signUpService = GetIt.instance<SignUpService>();

  @override
  void onClose() {
    fullName.dispose();
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
    super.onClose();
  }

  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    required String fullName,
  }) async {
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final bool shouldNavigateToOtp = await signUpService.signUpUser(
        username: username,
        password: password,
        email: email,
        fullName: fullName,
      );

      // Dismiss loading dialog
      Get.back();

      if (shouldNavigateToOtp) {
        SnackbarHelper.showCustomSnackbar(
            'Success', 'Sign up successful. Please enter OTP.',
            backgroundColor: Colors.green);
        Get.toNamed(Routes.OTP);
      } else {
        SnackbarHelper.showCustomSnackbar(
            'Error', 'Sign up failed. Please try again.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      // Dismiss loading dialog
      Get.back();

      SnackbarHelper.showCustomSnackbar(
          'Error', 'An unexpected error occurred: $e',
          backgroundColor: Colors.red);
    }
  }
}

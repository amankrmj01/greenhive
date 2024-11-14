import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../auth/toast_message.dart';
import '../../../infrastructure/dal/services/aws/sign_up_service.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../widgets/snackbar_c.dart';

class OtpController extends GetxController {
  final otpController = TextEditingController();
  final toastMessage = ToastMessage(
          message: '',
          backgroundColor: Colors.red,
          icon:
              const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.white))
      .obs;

  final SignUpService signUpService = GetIt.instance<SignUpService>();

  @override
  void onInit() {
    otpController.text = '';
    super.onInit();
  }

  Future<void> confirmOtp({
    required String username,
    required String confirmationCode,
  }) async {
    if (confirmationCode.length != 6) {
      SnackbarHelper.showCustomSnackbar('Error', 'Please enter OTP',
          backgroundColor: Colors.red.withOpacity(0.2));
      return;
    }

    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final result = await signUpService.confirmUser(
        username: username,
        confirmationCode: confirmationCode,
      );

      // Dismiss loading dialog
      Get.back();

      if (!result) {
        SnackbarHelper.showCustomSnackbar(
            'Success', 'OTP confirmed successfully',
            backgroundColor: Colors.green);
        Get.offAllNamed(Routes.HOME);
      } else {
        SnackbarHelper.showCustomSnackbar('Error', 'Failed to confirm OTP',
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

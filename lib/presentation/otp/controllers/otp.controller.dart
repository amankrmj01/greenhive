import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../auth/toast_message.dart';
import '../../../infrastructure/dal/services/aws/sign_up_service.dart';

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
      toastMessage.value = ToastMessage(
        message: 'Please enter OTP',
        backgroundColor: Colors.red.withOpacity(0.2),
        icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.red),
      );
      return;
    }
    await signUpService.confirmUser(
      username: username,
      confirmationCode: confirmationCode,
    );
  }
}

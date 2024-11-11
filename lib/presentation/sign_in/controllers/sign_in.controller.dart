import 'package:get_it/get_it.dart';
import 'package:greenhive/infrastructure/dal/services/aws/sign_in_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';

class SignInController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final otpCode = TextEditingController();

  final SignInService signInService = GetIt.instance<SignInService>();

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
    otpCode.dispose();
  }

  Future<void> signInUser(String username, String password) async {
    final isSignedIn = await signInService.signInUser(
      username: username,
      password: password,
    );

    if (isSignedIn) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}

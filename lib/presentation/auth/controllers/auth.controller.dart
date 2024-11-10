import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_in/controllers/sign_in.controller.dart';
import '../../sign_up/controllers/sign_up.controller.dart';

class AuthController extends GetxController {
  final isLogoAtTop = false.obs;
  final pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
    Get.put(SignInController());
    Get.put(SignUpController());

    Future.delayed(const Duration(seconds: 1), () {
      isLogoAtTop.value = true;
    });
  }
}

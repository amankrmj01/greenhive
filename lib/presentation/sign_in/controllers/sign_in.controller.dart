import 'package:greenhive/infrastructure/dal/services/aws/sign_in_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final otpCode = TextEditingController();

  late SignInService signInService;

  SignInController();

  void setSignInService(SignInService service) {
    signInService = service;
  }

  @override
  void onClose() {
    super.onClose();
    username.dispose();
    password.dispose();
    otpCode.dispose();
  }

  Future<void> signInUser(String username, String password) async {
    await signInService.signInUser(username: username, password: password);
  }
}

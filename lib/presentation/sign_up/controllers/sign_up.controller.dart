import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../infrastructure/dal/services/aws/sign_up_service.dart';
import '../../../infrastructure/navigation/routes.dart';

class SignUpController extends GetxController {
  final fullName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();

  late SignUpService signUpService;

  SignUpController();

  void setSignUpService(SignUpService service) {
    signUpService = service;
  }

  @override
  void onClose() {
    super.onClose();
    fullName.dispose();
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    email.dispose();
  }

  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    required String fullName,
  }) async {
    final bool shouldNavigateToOtp = await signUpService.signUpUser(
      username: username,
      password: password,
      email: email,
      fullName: fullName,
    );

    if (shouldNavigateToOtp) {
      Get.toNamed(Routes.OTP);
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../infrastructure/dal/services/aws/sign_up_service.dart';
import '../../../infrastructure/navigation/routes.dart';

class SignUpController extends GetxController {
  final fullName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();

  final signUpService = GetIt.instance<SignUpService>();

  @override
  void onInit() {
    super.onInit();
  }

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

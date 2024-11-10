import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../auth/controllers/auth.controller.dart';
import '../widgets/text_area.dart';
import 'controllers/sign_up.controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authScreenController = Get.find<AuthController>();
    return SafeArea(
      child: Obx(
        () => AnimatedScale(
          scale: authScreenController.isLogoAtTop.value ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: authScreenController.isLogoAtTop.value ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              buildNameTextField(),
                              const SizedBox(height: 16),
                              buildUserNameTextField(),
                              const SizedBox(height: 16),
                              buildEmailTextField(),
                              const SizedBox(height: 16),
                              buildPasswordTextField(),
                              const SizedBox(height: 16),
                              buildConfirmPasswordTextField(),
                            ],
                          ).box.p16.make(),
                          const SizedBox(height: 16),
                          buildAlreadyHaveAnAccount(authScreenController),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: buildSignUpButton(),
                          ),
                        ],
                      )
                          .box
                          .p4
                          .color(Colors.white.withOpacity(0.2))
                          .customRounded(BorderRadius.circular(16))
                          .make(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildSignUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        minimumSize: const Size(80, 40),
        maximumSize: const Size(80, 40),
      ),
      onPressed: () {
        controller.signUpUser(
          username: controller.username.text,
          password: controller.password.text,
          email: controller.email.text,
          fullName: controller.fullName.text,
        );
      },
      child: const Text('Sign Up'),
    );
  }

  MyTextArea buildConfirmPasswordTextField() {
    return MyTextArea(
      textInputType: TextInputType.visiblePassword,
      controller: controller.confirmPassword,
      isObscure: true,
      labelText: 'Confirm Password',
      preFixIcon: const Icon(Icons.lock),
      prefix: true,
    );
  }

  MyTextArea buildPasswordTextField() {
    return MyTextArea(
      textInputType: TextInputType.visiblePassword,
      controller: controller.password,
      isObscure: true,
      labelText: 'Password',
      preFixIcon: const Icon(Icons.lock),
      prefix: true,
    );
  }

  MyTextArea buildEmailTextField() {
    return MyTextArea(
      textInputType: TextInputType.emailAddress,
      controller: controller.email,
      isObscure: false,
      labelText: 'Email',
      preFixIcon: const Icon(Icons.email),
      prefix: true,
    );
  }

  MyTextArea buildUserNameTextField() {
    return MyTextArea(
      textInputType: TextInputType.name,
      controller: controller.username,
      isObscure: false,
      labelText: 'User Name',
      preFixIcon: const Icon(Icons.person),
      prefix: true,
    );
  }

  MyTextArea buildNameTextField() {
    return MyTextArea(
      textInputType: TextInputType.name,
      controller: controller.fullName,
      isObscure: false,
      labelText: 'Name',
      preFixIcon: const Icon(Icons.person),
      prefix: true,
    );
  }

  Row buildAlreadyHaveAnAccount(AuthController authScreenController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        'Already have an Account?'.text.make(),
        const SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            minimumSize: const Size(60, 30),
            maximumSize: const Size(60, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            authScreenController.pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}

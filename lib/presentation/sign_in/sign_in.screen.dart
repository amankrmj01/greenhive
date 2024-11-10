import 'package:greenhive/presentation/widgets/text_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../auth/controllers/auth.controller.dart';
import 'controllers/sign_in.controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Column(
                    children: [
                      MyTextArea(
                        textInputType: TextInputType.name,
                        controller: controller.username,
                        isObscure: false,
                        labelText: 'Username',
                        preFixIcon: const Icon(Icons.person),
                        prefix: true,
                      ),
                      const SizedBox(height: 16),
                      MyTextArea(
                        textInputType: TextInputType.visiblePassword,
                        controller: controller.password,
                        isObscure: true,
                        labelText: 'Password',
                        preFixIcon: const Icon(Icons.lock),
                        prefix: true,
                      ),
                    ],
                  ).box.p16.make(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Create Account'.text.make(),
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
                            1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                  'Forgot Password?'.text.make(),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        minimumSize: const Size(80, 40),
                        maximumSize: const Size(80, 40),
                      ),
                      onPressed: () {
                        controller.signInUser(
                          controller.username.text,
                          controller.password.text,
                        );
                      },
                      child: const Text('Sign In'),
                    ),
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
        ),
      ),
    );
  }
}

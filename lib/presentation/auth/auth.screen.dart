import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:greenhive/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colors.red, Colors.teal, 0.7),
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                top: controller.isLogoAtTop.value
                    ? 100
                    : MediaQuery.of(context).size.height / 2 - 80,
                child: AnimatedContainer(
                  padding: const EdgeInsets.all(2),
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color.lerp(Colors.red, Colors.teal, 0.7),
                    boxShadow: [
                      BoxShadow(
                        color: Color.lerp(Colors.white, Colors.teal, 0.3)!,
                        offset: const Offset(-2, -2),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color.lerp(Colors.black, Colors.teal, 0.3)!,
                        offset: const Offset(2, 2),
                        blurRadius: 6,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  height: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/logo/logo.png',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250),
              padding: const EdgeInsets.all(16),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                padEnds: true,
                controller: controller.pageController,
                children: const [
                  SignInScreen(),
                  SignUpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

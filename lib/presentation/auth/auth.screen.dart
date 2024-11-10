import 'package:greenhive/presentation/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  // void showToast({
  //   required String message,
  //   required Color backgroundColor,
  //   required Icon icon,
  //   required BuildContext context,
  // }) {
  //   InteractiveToast.closeAllToast;
  //   InteractiveToast.slide(
  //     context,
  //     trailing: icon,
  //     toastSetting: const SlidingToastSetting(
  //       showProgressBar: false,
  //       toastAlignment: Alignment.bottomCenter,
  //     ),
  //     title: Text(message),
  //     toastStyle: ToastStyle(
  //       backgroundColor: backgroundColor,
  //       glassBlur: 10,
  //       border: Border.all(color: backgroundColor),
  //     ),
  //   );
  // }
  //
  // void showSignUpComplete(BuildContext context, String e) {
  //   showToast(
  //     context: context,
  //     message: 'Sign up is complete',
  //     backgroundColor: Colors.green,
  //     icon: const Icon(CupertinoIcons.check_mark_circled, color: Colors.white),
  //   );
  // }
  //
  // // Method for handling error
  // void showError(BuildContext context, String errorMessage) {
  //   showToast(
  //     context: context,
  //     message: 'Error: $errorMessage',
  //     backgroundColor: Colors.red,
  //     icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.white),
  //   );
  // }

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
                  padding: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
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
                  child: Image.asset(
                    'assets/logo/logo.png',
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

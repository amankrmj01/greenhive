import 'package:greenhive/presentation/sign_up/controllers/sign_up.controller.dart';
import 'package:greenhive/presentation/utils/popus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pinput/pinput.dart';

import 'controllers/otp.controller.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.find<SignUpController>();
    final GlobalKey<PopUpsState> popUpsKey = GlobalKey<PopUpsState>();
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Please enter the OTP sent to mail',
                  style: TextStyle(fontSize: 16),
                ).centered(),
                const SizedBox(height: 8),
                Text(
                  signUpController.email.text,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  length: 6,
                  controller: controller.otpController,
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.otpController.text.length != 6) {
                      popUpsKey.currentState?.showPopUp(
                        Get.overlayContext!,
                        'Please enter OTP',
                        false,
                        Colors.red.withOpacity(0.2),
                        Colors.red,
                        const Icon(Icons.error, color: Colors.white),
                        const Duration(seconds: 1),
                      );
                    } else {
                      popUpsKey.currentState?.showPopUp(
                        Get.overlayContext!,
                        'Confirming User',
                        false,
                        Colors.yellow.withOpacity(0.2),
                        Colors.orangeAccent,
                        const Icon(Icons.error, color: Colors.white),
                        const Duration(seconds: 1),
                      );
                      controller.confirmOtp(
                        username: signUpController.email.text,
                        confirmationCode: controller.otpController.text,
                      );
                    }
                  },
                  child: const Text('Confirm OTP'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'Wrong email?'.text.make(),
                    const Icon(Icons.edit).onInkTap(() {
                      Get.back();
                    }),
                  ],
                ),
                PopUps(key: popUpsKey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

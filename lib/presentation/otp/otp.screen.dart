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
    SignUpController signUpController = Get.find<SignUpController>();
    final GlobalKey<PopUpsState> popUpsKey = GlobalKey<PopUpsState>();
    final defaultPinTheme = PinTheme(
        width: 50,
        height: 50,
        textStyle: const TextStyle(fontSize: 22, color: Colors.black),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              16.heightBox,
              const Text('Please enter the OTP sent to mail',
                      style: TextStyle(fontSize: 16))
                  .centered(),
              signUpController.email.text.text.size(20).bold.make(),
              16.heightBox,
              Pinput(
                defaultPinTheme: defaultPinTheme,
                length: 6,
                onTapOutside: (_) {},
                controller: controller.otpController,
                autofocus: true,
              ),
              16.heightBox,
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
                      username: signUpController.email.text.toString(),
                      confirmationCode:
                          controller.otpController.text.toString(),
                    );
                  }
                },
                child: const Text('Confirm OTP'),
              ),
              16.heightBox,
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
          ).paddingAll(8),
        ).paddingAll(16),
      ),
    );
  }
}

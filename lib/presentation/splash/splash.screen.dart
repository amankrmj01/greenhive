import 'package:greenhive/consts/app_details/app_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.lerp(Colors.red, Colors.teal, 0.7),
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: _buildLogoContainer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: appVersion.text.minFontSize(20).make(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoContainer() {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color.lerp(Colors.red, Colors.teal, 0.7),
        boxShadow: _buildBoxShadows(),
      ),
      child: Image.asset('assets/logo/logo.png'),
    );
  }

  List<BoxShadow> _buildBoxShadows() {
    return [
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
    ];
  }
}

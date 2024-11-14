// lib/utils/snackbar_helper.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showCustomSnackbar(String title, String message,
      {Color backgroundColor = Colors.teal, Color colorText = Colors.white}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor.withOpacity(0.8),
      borderColor: Colors.white.withOpacity(0.4),
      borderWidth: 2,
      colorText: colorText,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      barBlur: 2,
    );
  }
}

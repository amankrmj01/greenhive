import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';

class PopUps extends StatefulWidget {
  const PopUps({super.key});

  @override
  State<PopUps> createState() => PopUpsState();
}

class PopUpsState extends State<PopUps> {
  void showPopUp(
      BuildContext context,
      String text,
      bool showProgressBar,
      Color backgroundColor,
      Color borderColor,
      Icon trailingIcon,
      Duration duration) {
    if (!mounted) return; // Check if widget is still mounted
    InteractiveToast.closeAllToast();
    InteractiveToast.slide(
      context,
      trailing: trailingIcon,
      toastSetting: SlidingToastSetting(
        showProgressBar: showProgressBar,
        toastAlignment: Alignment.topCenter,
        animationDuration: duration,
      ),
      title: Text(text),
      toastStyle: ToastStyle(
        backgroundColor: backgroundColor,
        glassBlur: 10,
        border: Border.all(color: borderColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder widget
  }
}

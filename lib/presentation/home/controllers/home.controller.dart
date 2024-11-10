import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final visible = false.obs;
  var now = DateTime.now().obs;
  var currDate = ''.obs;
  var greeting = ''.obs;
  var topPosition = 0.0.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    currDate.value = DateFormat('MMM d, yyyy').format(now.value);
    scrollController.addListener(() {
      if (scrollController.position.pixels > 0) {
        visible.value = true;
      } else {
        visible.value = false;
      }
    });
    scrollController.addListener(() {
      topPositionValue();
    });
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting.value = 'Good Morning ☀️';
    } else if (hour < 17) {
      greeting.value = 'Good Afternoon 🌤️';
    } else {
      greeting.value = 'Good Evening 🌕';
    }
    return greeting.value;
  }

  void topPositionValue() {
    if (!scrollController.hasClients) {
      topPosition.value = 0;
    }
    double scrollOffset = scrollController.position.pixels;
    topPosition.value = scrollOffset > 240 ? -240 : -scrollOffset;
  }
}

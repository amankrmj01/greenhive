import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/Greenhouse.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final visible = false.obs;
  var now = DateTime.now().obs;
  var currDate = ''.obs;
  var greeting = ''.obs;
  var topPosition = 0.0.obs;
  TextEditingController searchController = TextEditingController();
  RxList<Greenhouse> greenhouses =
      <Greenhouse>[].obs; // Reactive list of greenhouses
  final isLoading = true.obs;

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
    scrollController.addListener(() {
      if (scrollController.position.pixels <= 0 &&
          scrollController.position.outOfRange) {
        fetchGreenhouses();
      }
    });
  }

  Future<void> fetchGreenhouses() async {
    try {
      isLoading.value = true;
      safePrint('Fetching greenhouses...');

      // 1. Get current authenticated user
      final authUser = await Amplify.Auth.getCurrentUser();
      final userId = authUser.userId;
      safePrint('Authenticated user ID: $userId');

      // 2. Query Greenhouses for the current user using Amplify API
      final request = ModelQueries.list(
        Greenhouse.classType,
        where: Greenhouse.USER.eq(userId),
      );
      final response = await Amplify.API.query(request: request).response;

      if (response.hasErrors) {
        // Handle error
        safePrint('Error fetching greenhouses: ${response.errors}');
        Get.snackbar('Error', 'Could not load greenhouses.',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // 3. Update the reactive list of greenhouses
      greenhouses.value =
          response.data?.items.whereType<Greenhouse>().toList() ?? [];
      safePrint('Greenhouses fetched: ${greenhouses.value.length}');
      isLoading.value = false; // Update loading state after fetching
    } catch (e) {
      isLoading.value = false;
      safePrint('Error fetching greenhouses: $e');
      Get.snackbar('Error', 'Could not load greenhouses.',
          snackPosition: SnackPosition.BOTTOM);
    }
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

  @override
  void onReady() {
    fetchGreenhouses();
    super.onReady();
  }
}

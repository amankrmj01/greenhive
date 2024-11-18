// lib/presentation/home/controllers/home.controller.dart
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/Greenhouse.dart';
import '../../../models/Microcontroller.dart';
import '../../widgets/snackbar_c.dart';

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
  final isActive = 'Loading...'.obs;

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
          scrollController.position.outOfRange) {}
    });
  }

  Future<void> fetchGreenhouses() async {
    try {
      isLoading.value = true;
      // 1. Get current authenticated user
      final authUser = await Amplify.Auth.getCurrentUser();
      final userId = authUser.userId;
      safePrint('User ID: $userId');

      // 2. Query Greenhouses for the current user using Amplify API
      final request = ModelQueries.list(
        Greenhouse.classType,
        where: Greenhouse.GREENHOUSEID.eq(userId),
      );
      final response = await Amplify.API.query(request: request).response;

      if (response.hasErrors) {
        // Handle error
        SnackbarHelper.showCustomSnackbar(
            'Error', 'Error fetching greenhouses: ${response.errors}',
            backgroundColor: Colors.red);
        return;
      }

      // 3. Update the reactive list of greenhouses
      greenhouses.value =
          response.data?.items.whereType<Greenhouse>().toList() ?? [];
      isLoading.value = false; // Update loading state after fetching
    } catch (e) {
      isLoading.value = false;
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Error fetching greenhouses: $e',
          backgroundColor: Colors.red);
    }
  }

  Future<void> checkGreenhouseIsActive(Greenhouse greenhouse) async {
    try {
      final microcontrollerId = greenhouse.greenhouseId;
      if (microcontrollerId.isEmpty) {
        throw Exception('Microcontroller ID is empty');
      }

      final microcontrollerIdentifier =
          MicrocontrollerModelIdentifier(microcontrollerId: microcontrollerId);
      final request = ModelQueries.get(
          Microcontroller.classType, microcontrollerIdentifier);
      final response = await Amplify.API.query(request: request).response;

      final microcontroller = response.data;
      if (microcontroller == null) {
        throw Exception('Microcontroller not found');
      }

      final updatedAt = microcontroller.updatedAt;
      if (updatedAt == null) {
        throw Exception('Microcontroller updatedAt is null');
      }

      DateTime updatedAtTime = updatedAt.getDateTimeInUtc();
      DateTime currentTime = DateTime.now().toUtc();

      Duration difference = currentTime.difference(updatedAtTime);

      if (difference.inMinutes <= 5) {
        isActive.value = 'Active';
      } else {
        isActive.value = 'Inactive';
      }
    } catch (e) {
      SnackbarHelper.showCustomSnackbar(
          'Error', 'Error checking greenhouse status: $e',
          backgroundColor: Colors.red);
    }
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 0 && hour < 6) {
      greeting.value = 'Good Night 🌙';
    } else if (hour >= 6 && hour < 12) {
      greeting.value = 'Good Morning ☀️';
    } else if (hour >= 12 && hour < 17) {
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

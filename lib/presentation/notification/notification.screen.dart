import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotificationScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

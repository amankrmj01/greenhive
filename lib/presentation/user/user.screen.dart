import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/user.controller.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cardColor = Color(0xffeff5f3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              child: Icon(
                CupertinoIcons.person,
                size: 60,
                color: Colors.white,
              ),
            ).p16(),
            Container(
              // User details container
              margin: const EdgeInsets.all(4.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text('Name: ${controller.userName.value}',
                        style: const TextStyle(fontSize: 18))),
                    Obx(() => Text('Email: ${controller.userEmail.value}',
                        style: const TextStyle(fontSize: 18))),
                  ],
                ),
              ),
            ),
            Container(
              // Push notifications container
              margin: const EdgeInsets.all(4.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => SwitchListTile(
                      title: const Text('Push Notifications'),
                      value: controller.notificationsEnabled.value,
                      onChanged: (bool value) {
                        controller.toggleNotifications(value);
                      },
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.8),
                elevation: 4,
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.black),
              ),
            ).p16(),
          ],
        ),
      ),
    );
  }
}

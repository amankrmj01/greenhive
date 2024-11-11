import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/user.controller.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.signOut();
                },
                child: const Text('LogOut'))
          ],
        ),
      ),
    );
  }
}

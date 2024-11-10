import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_green_house.controller.dart';

class AddGreenHouseScreen extends GetView<AddGreenHouseController> {
  const AddGreenHouseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddGreenHouseScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddGreenHouseScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

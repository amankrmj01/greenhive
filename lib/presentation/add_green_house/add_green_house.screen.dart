import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/add_green_house.controller.dart';

class AddGreenHouseScreen extends GetView<AddGreenHouseController> {
  const AddGreenHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Greenhouse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration:
                      const InputDecoration(labelText: 'Greenhouse Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.microcontrollerIdController,
                  decoration:
                      const InputDecoration(labelText: 'Microcontroller ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Microcontroller ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.cropNameController,
                  decoration: const InputDecoration(labelText: 'Crop Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Crop Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.cropTimePeriodController,
                  decoration: const InputDecoration(
                      labelText: 'Crop Time Period (days)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter time period';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Invalid number format';
                    }
                    return null;
                  },
                ),
                Obx(
                  () => SwitchListTile(
                    title: const Text('Greenhouse Active'),
                    value: controller.isActive.value,
                    onChanged: (value) {
                      controller.isActive.value = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.saveGreenhouse();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

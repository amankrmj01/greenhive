import 'dart:ui';
import 'package:greenhive/consts/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'controllers/green_house.controller.dart';

class GreenHouseScreen extends GetView<GreenHouseController> {
  const GreenHouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  title: Obx(() => _buildAppBarTitle(context)),
                  background: Image.asset(
                    Images.greenhouse02,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _climateInfo(),
                    16.heightBox,
                    _deviceControls(),
                    16.heightBox,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        controller.deleteCurrentMicrocontrollerAndGreenhouse();
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 40,
            child: Obx(
              () => AnimatedContainer(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: controller.isActive.value
                      ? Colors.green.withOpacity(0.4)
                      : Colors.red.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                duration: const Duration(milliseconds: 100),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    8.widthBox,
                    Text(
                      controller.isActive.value ? 'Active' : 'Inactive',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    8.widthBox,
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: controller.isActive.value
                            ? Colors.green
                            : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    8.widthBox,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // AppBar title widget for displaying greenhouse details
  Widget _buildAppBarTitle(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: controller.hide.value
                ? Colors.transparent
                : Colors.white.withOpacity(0.5),
          ),
          child: Obx(() => controller.hide.value
              ? const Text('Greenhouse Name')
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(Get.arguments.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Description', style: TextStyle(fontSize: 14)),
                  ],
                )),
        ),
      ),
    );
  }

  // Sensor data widget
  Widget _climateInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 354.20,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.80),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4.40,
            offset: Offset(0, 4.40),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            16.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildData(
                    'Temperature',
                    const Icon(Icons.thermostat, color: Colors.red),
                    controller.temperature),
                _buildData(
                    'Humidity',
                    const Icon(Icons.water_drop, color: Colors.blue),
                    controller.humidity),
              ],
            ),
            16.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildData(
                    'Soil Moisture',
                    const Icon(Icons.grass_rounded, color: Colors.green),
                    controller.soilMoisture),
                _buildData(
                    'Light',
                    const Icon(Icons.wb_sunny, color: Colors.yellow),
                    controller.light),
              ],
            ),
            16.heightBox,
          ],
        ),
      ),
    );
  }

  // Device controls widget for Fan, Light, and Water Pump
  Widget _deviceControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 354.20,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19.80),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4.40,
            offset: Offset(0, 4.40),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Device Controls',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              .p16(),
          _deviceControlRow(
            'Fan',
            controller.fanStatus,
            (value) => controller.updateDeviceStatus(value!, 'fan'),
          ),
          _deviceControlRow(
            'Light',
            controller.lightStatus,
            (value) => controller.updateDeviceStatus(value!, 'light'),
          ),
          _deviceControlRow(
            'Water Pump',
            controller.waterPumpStatus,
            (value) => controller.updateDeviceStatus(value!, 'waterPump'),
          ),
          16.heightBox,
        ],
      ),
    );
  }

  // Reusable row for individual device control
  Widget _deviceControlRow(
      String label, RxString status, void Function(String?) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        Obx(
          () {
            // Debugging print to verify the current value of status
            // safePrint("Current status for $label: ${status.value}");
            return DropdownButton<String>(
              borderRadius: BorderRadius.circular(16),
              value: status.value, // Ensure this matches one of the item values
              items: const [
                DropdownMenuItem(value: 'ON', child: Text('ON')),
                DropdownMenuItem(value: 'OFF', child: Text('OFF')),
                DropdownMenuItem(value: 'AUTO', child: Text('AUTO')),
              ],
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildData(String title, Icon icon, RxString data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon.icon, color: icon.color, size: 32),
        4.heightBox,
        title.text.xl2.make(),
        4.heightBox,
        Obx(() => data.value.text.make()),
      ],
    );
  }
}

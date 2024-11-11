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
      body: CustomScrollView(
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
              ],
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
          child: controller.hide.value
              ? const Text('Greenhouse Name')
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Greenhouse Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Description', style: TextStyle(fontSize: 14)),
                  ],
                ),
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
                  Icon(Icons.thermostat, color: Colors.red),
                  controller.temperature),
              _buildData('Humidity', Icon(Icons.water_drop, color: Colors.blue),
                  controller.humidity),
            ],
          ),
          16.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildData(
                  'CO2', Icon(Icons.air, color: Colors.green), controller.co2),
              _buildData('Light', Icon(Icons.wb_sunny, color: Colors.yellow),
                  controller.light),
            ],
          ),
          16.heightBox,
        ],
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
          _deviceControlRow('Fan', controller.fanStatus,
              (value) => controller.updateFanStatus(value)),
          _deviceControlRow('Light', controller.lightStatus,
              (value) => controller.updateLightStatus(value)),
          _deviceControlRow('Water Pump', controller.waterPumpStatus,
              (value) => controller.updateWaterPumpStatus(value)),
          16.heightBox,
        ],
      ),
    );
  }

  // Reusable row for individual device control
  Widget _deviceControlRow(
      String label, RxString status, Function(String) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        DropdownButton<String>(
          borderRadius: BorderRadius.circular(16),
          value: status.value,
          items: const [
            DropdownMenuItem(value: 'ON', child: Text('ON')),
            DropdownMenuItem(value: 'OFF', child: Text('OFF')),
            DropdownMenuItem(value: 'AUTO', child: Text('AUTO')),
          ],
          onChanged: (_) {},
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

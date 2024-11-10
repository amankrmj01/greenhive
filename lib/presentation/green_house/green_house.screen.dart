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
            child: _climateInfo(),
          ),
        ],
      ),
    );
  }

  // Extracted the title widget for better organization
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
              ? const Text('name')
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('description', style: TextStyle(fontSize: 14)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _climateInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 354.20,
      // height: 135.30,
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
              _buildData('title', const Icon(Icons.hot_tub), 'data'),
              _buildData('title', const Icon(Icons.hot_tub), 'data'),
            ],
          ),
          16.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildData('title', const Icon(Icons.hot_tub), 'data'),
              _buildData('title', const Icon(Icons.hot_tub), 'data'),
            ],
          ),
          16.heightBox,
        ],
      ),
    );
  }

  Widget _buildData(
    String title,
    Icon icon,
    String data,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon.icon,
          color: icon.color,
          size: 32,
        ),
        4.heightBox,
        title.text.xl2.make(),
        4.heightBox,
        data.text.make(),
      ],
    );
  }
}

import 'package:greenhive/consts/images.dart';
import 'package:greenhive/infrastructure/navigation/routes.dart';
import 'package:greenhive/presentation/home/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                top: controller.topPosition.value,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Images.Home_Background_01,
                      ),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              )),
          SafeArea(
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  expandedHeight: MediaQuery.sizeOf(context).height * 0.2,
                  collapsedHeight: 100,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Visibility(
                          visible: !controller.visible.value,
                          replacement: const SizedBox.shrink(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller
                                      .getGreeting()
                                      .text
                                      .xl3
                                      .white
                                      .make(),
                                  controller.currDate.value.text.sm.white
                                      .make(),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.notifications,
                                      size: 32,
                                    ),
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.USER);
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.person_alt_circle,
                                      size: 32,
                                    ),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ).paddingOnly(
                        top: 16,
                      ),
                      const CSearchBar().paddingOnly(bottom: 16),
                      // 0.heightBox,
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 15,
                    (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.GREEN_HOUSE, arguments: []);
                        },
                        child: Container(
                          width: 322,
                          height: 200,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              10.heightBox,
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  Images.greenHouse,
                                  width: 322,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  16.widthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      'Green House ${index + 1}'.text.xl.make(),
                                      'Location: ${index + 1}'.text.make(),
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      'Active'.text.make(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const CircleAvatar(
                                          maxRadius: 8,
                                          backgroundColor: Colors.teal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  16.widthBox,
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.ADD_GREEN_HOUSE);
        },
        label: 'Add new'.text.make(),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

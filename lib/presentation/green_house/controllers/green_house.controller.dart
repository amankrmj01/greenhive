import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GreenHouseController extends GetxController {
  ScrollController scrollController = ScrollController();
  final hide = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
  }

  void hideFxn() {
    if (scrollController.position.pixels > 180) {
      debugPrint('hide $scrollController.position.pixels');
      hide.value = true;
    } else {
      debugPrint('show $scrollController.position.pixels');
      hide.value = false;
    }
  }
}

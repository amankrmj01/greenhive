import 'package:get/get.dart';

import '../../../../presentation/green_house/controllers/green_house.controller.dart';

class GreenHouseControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GreenHouseController>(
      () => GreenHouseController(),
    );
  }
}

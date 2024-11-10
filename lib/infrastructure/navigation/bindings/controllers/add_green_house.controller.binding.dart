import 'package:get/get.dart';

import '../../../../presentation/add_green_house/controllers/add_green_house.controller.dart';

class AddGreenHouseControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddGreenHouseController>(
      () => AddGreenHouseController(),
    );
  }
}

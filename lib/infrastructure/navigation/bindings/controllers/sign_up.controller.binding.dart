import 'package:get/get.dart';

import '../../../../presentation/sign_up/controllers/sign_up.controller.dart';

class SignUpControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}

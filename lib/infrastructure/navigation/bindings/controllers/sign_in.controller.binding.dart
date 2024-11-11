import 'package:get/get.dart';

import '../../../../presentation/sign_in/controllers/sign_in.controller.dart';

class SignInControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}

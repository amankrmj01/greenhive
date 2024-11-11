import 'package:greenhive/infrastructure/dal/services/aws/sign_in_service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../presentation/sign_in/controllers/sign_in.controller.dart';

class SignInControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}

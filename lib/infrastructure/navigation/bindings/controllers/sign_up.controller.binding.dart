import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../../../../presentation/sign_up/controllers/sign_up.controller.dart';
import '../../../dal/services/aws/sign_up_service.dart';

class SignUpControllerBinding extends Bindings {
  @override
  void dependencies() {
    final signUpService = GetIt.instance<SignUpService>();
    final signUpController = SignUpController();
    signUpController.setSignUpService(signUpService);
    Get.put(signUpController);
  }
}

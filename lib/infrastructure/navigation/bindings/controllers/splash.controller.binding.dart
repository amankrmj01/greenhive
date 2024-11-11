import 'package:get/get.dart';

import '../../../../presentation/splash/controllers/splash.controller.dart';
import '../../../dal/services/aws/aws_service.dart';
import '../../../dal/services/aws/session_service.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
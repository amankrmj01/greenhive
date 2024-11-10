import 'package:greenhive/infrastructure/dal/services/aws/session_service.dart';
import 'package:greenhive/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late SessionService _sessionService;

  void setSessionService(SessionService service) {
    _sessionService = service;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  _navigateToSignIn() async {
    await Future.delayed(
        const Duration(seconds: 2),
        () async => await _sessionService.fetchAuthSession()
            ? Get.offNamed(Routes.HOME)
            : Get.offNamed(Routes.AUTH));
  }

  @override
  void onReady() {
    _navigateToSignIn();
    super.onReady();
  }
}

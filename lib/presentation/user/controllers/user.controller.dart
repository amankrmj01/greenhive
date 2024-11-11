import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greenhive/infrastructure/dal/services/aws/sign_out_service.dart';
import 'package:greenhive/infrastructure/navigation/routes.dart';

class UserController extends GetxController {
  final SignOutService _signOutService = GetIt.instance<SignOutService>();

  Future<void> signOut() async {
    try {
      final logout = await _signOutService.signOut();
      if (logout) {
        Get.offAllNamed(Routes.AUTH);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}

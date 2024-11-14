import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:greenhive/infrastructure/dal/services/aws/sign_out_service.dart';
import 'package:greenhive/infrastructure/navigation/routes.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class UserController extends GetxController {
  final SignOutService _signOutService = GetIt.instance<SignOutService>();

  // Observable variables to store user data and notification setting
  var userName = ''.obs;
  var userEmail = ''.obs;
  var notificationsEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  // Fetch the current user details
  Future<void> fetchCurrentUser() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      userName.value = attributes
          .firstWhere((attr) => attr.userAttributeKey.key == 'name')
          .value;

      // Additional user attributes
      userEmail.value = attributes
          .firstWhere((attr) => attr.userAttributeKey.key == 'email')
          .value;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user details: $e');
    }
  }

  // Toggle notification setting
  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    // Here you would typically call a service to update this setting in a database
  }

  // Sign out function
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
}

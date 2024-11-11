import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:get/get.dart';

import '../../../navigation/routes.dart';
import '../auth/sign_in.dart';

class SignInService implements ISignInService {
  @override
  Future<bool> signInUser({
    required String username,
    required String password,
  }) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
      return await _handleSignInResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
      return false;
    }
  }

  Future<bool> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignInWithOtpCode:
        safePrint('Prompt for OTP');
        // _promptForOtpCode();
        return false;
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        Get.offNamed(Routes.HOME);
        return true;
      default:
        safePrint('Unhandled sign-in step: ${result.nextStep.signInStep}');
        return false;
    }
  }
}

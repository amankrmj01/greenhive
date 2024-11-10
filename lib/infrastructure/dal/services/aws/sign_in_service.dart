import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:get/get.dart';

import '../../../navigation/routes.dart';
import '../auth/sign_in.dart';

class SignInService implements ISignInService {
  final AmplifyAuthCognito _auth;

  SignInService(this._auth);

  @override
  Future<void> signInUser({
    required String username,
    required String password,
  }) async {
    try {
      final result = await _auth.signIn(
        username: username,
        password: password,
      );
      await _handleSignInResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
  }

  Future<void> _handleSignInResult(SignInResult result) async {
    switch (result.nextStep.signInStep) {
      case AuthSignInStep.confirmSignInWithOtpCode:
        safePrint('Prompt for OTP');
        // _promptForOtpCode();
        break;
      case AuthSignInStep.done:
        safePrint('Sign in is complete');
        Get.offNamed(Routes.HOME);
        break;
      default:
        safePrint('Unhandled sign-in step: ${result.nextStep.signInStep}');
    }
  }
}

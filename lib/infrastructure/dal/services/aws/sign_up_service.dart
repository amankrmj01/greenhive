import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../auth/sign_up.dart';

class SignUpService implements ISignUpService {
  @override
  Future<bool> signUpUser({
    required String username,
    required String password,
    required String email,
    required String fullName,
  }) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        AuthUserAttributeKey.name: fullName,
        AuthUserAttributeKey.preferredUsername: username,
      };
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return await _handleSignUpResult(result);
    } on AuthException catch (e) {
      throw Exception('Error signing up user: ${e.message}');
    }
  }

  Future<bool> _handleSignUpResult(SignUpResult result) async {
    if (Get.context == null) return false;
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        return true;
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
        return false;
      default:
        return false;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    if (Get.context == null) return;
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  Future<bool> confirmUser({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      return await _handleSignUpResult(result);
    } on AuthException catch (e) {
      throw Exception('Error confirming user: ${e.message}');
    }
  }
}

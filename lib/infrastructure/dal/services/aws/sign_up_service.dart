import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../presentation/auth/toast_message.dart';
import '../../../navigation/routes.dart';
import '../auth/sign_up.dart';

class SignUpService implements ISignUpService {
  final toastMessage = Rx<ToastMessage?>(null);
  final AmplifyAuthCognito _auth;

  SignUpService(this._auth);

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
      final result = await _auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return await _handleSignUpResult(result);
    } on AuthException catch (e) {
      toastMessage.value = ToastMessage(
        message: 'Error signing up user: ${e.message}',
        backgroundColor: Colors.red,
        icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.white),
      );
      safePrint('Error signing up user: ${e.message}');
      return false;
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
        toastMessage.value = ToastMessage(
          message: 'Sign up is complete',
          backgroundColor: Colors.green,
          icon: const Icon(CupertinoIcons.check_mark_circled,
              color: Colors.white),
        );
        safePrint('Sign up is complete');
        Get.toNamed(Routes.HOME);
        return false;
      default:
        return false;
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    if (Get.context == null) return;
    toastMessage.value = ToastMessage(
      message:
          'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
          'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
      backgroundColor: Colors.green,
      icon: const Icon(CupertinoIcons.check_mark_circled, color: Colors.white),
    );
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
      toastMessage.value = ToastMessage(
        message: 'Error confirming user: ${e.message}',
        backgroundColor: Colors.red,
        icon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.white),
      );

      safePrint('Error confirming user: ${e.message}');
      return false;
    }
  }
}

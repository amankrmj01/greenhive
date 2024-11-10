import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../auth/sign_out.dart';

class SignOutService implements ISignOutService {
  final AmplifyAuthCognito _auth;

  SignOutService(this._auth);

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on AuthException catch (e) {
      throw Exception('Error signing out user: ${e.message}');
    }
  }
}

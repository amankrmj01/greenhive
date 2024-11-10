import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';

class SessionService {
  final AmplifyAuthCognito _auth;

  SessionService(this._auth);

  Future<bool> fetchAuthSession() async {
    try {
      final result = await _auth.fetchAuthSession();
      safePrint('User is signed in: ${result.isSignedIn}');
      return result.isSignedIn;
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
    return false;
  }
}

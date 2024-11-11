import 'package:amplify_core/amplify_core.dart';

import 'aws_service.dart';

class SessionService {
  Future<bool> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      safePrint('User is signed in: ${result.isSignedIn}');
      return result.isSignedIn;
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
    return false;
  }
}

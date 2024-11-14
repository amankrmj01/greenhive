import 'package:amplify_core/amplify_core.dart';

class SessionService {
  Future<bool> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      return result.isSignedIn;
    } on AuthException catch (e) {
      throw Exception('Error retrieving auth session: ${e.message}');
    }
  }
}

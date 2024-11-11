import 'package:amplify_core/amplify_core.dart';
import '../auth/sign_out.dart';

class SignOutService implements ISignOutService {
  @override
  Future<bool> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint('Error signing out: ${e.message}');
      return false;
    }
    return true;
  }
}

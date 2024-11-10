abstract class ISignInService {
  Future<void> signInUser({
    required String username,
    required String password,
  });
}

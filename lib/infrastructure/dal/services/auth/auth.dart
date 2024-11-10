abstract class IAuthService {
  Future<void> signUpUser();

  Future<void> signInUser();

  Future<void> signOut();
}

abstract class ISignUpService {
  Future<void> signUpUser({
    required String username,
    required String password,
    required String email,
    required String fullName,
  });
}

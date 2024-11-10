class PasswordValidator {
  static bool passwordStrength(String password) {
    if (password.length < 8) {
      return false;
    }
    // if (!password.contains(RegExp(r'[A-Z]'))) {
    //   return false;
    // }
    // if (!password.contains(RegExp(r'[a-z]'))) {
    //   return false;
    // }
    // if (!password.contains(RegExp(r'[0-9]'))) {
    //   return false;
    // }
    // if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return false;
    // }
    return true;
  }

  static bool passwordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}

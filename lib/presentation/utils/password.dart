class PasswordValidator {
  static String passwordStrength(String password) {
    String errors = '';

    if (password.length < 8) {
      errors += 'Password must be at least 8 characters long\n';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errors += 'Password must contain at least one uppercase letter\n';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      errors += 'Password must contain at least one lowercase letter\n';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      errors += 'Password must contain at least one digit\n';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errors += 'Password must contain at least one special character\n';
    }

    return errors.isEmpty ? 'Password is strong' : errors.trim();
  }
}

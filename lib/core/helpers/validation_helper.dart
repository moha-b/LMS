class ValidationHelper {
  ValidationHelper._();

  static final ValidationHelper instance = ValidationHelper._();

  factory ValidationHelper() => instance;

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
      // } else if (password.length < 6) {
      //   return 'Password must be at least 6 characters';
      // } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      //   return 'Password must contain an uppercase letter';
      // } else if (!RegExp(r'[a-z]').hasMatch(password)) {
      //   return 'Password must contain a lowercase letter';
      // } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      //   return 'Password must contain a digit';
      // }
      return null;
    }
    return null;
  }
}

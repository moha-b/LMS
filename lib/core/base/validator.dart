import 'dart:async';

class Validator {
  static final Validator _instance = Validator._internal();

  factory Validator() {
    return _instance;
  }

  Validator._internal();

  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (emailRegex.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email address');
    }
  });

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        sink.addError('Password cannot be empty');
      } else if (password.length > 7) {
        sink.add(password);
      } else {
        sink.addError('Password must be at least 8 characters long');
      }
    },
  );
}

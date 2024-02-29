


import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/base/validator.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  late StreamController<String> emailController;
  late Stream<String> validatedEmailStream;

  LoginCubit() : super(InitialLoginState()) {
    // Initialize the email controller
    emailController = StreamController<String>();

    // Connect the emailValidator to your email stream
    validatedEmailStream = emailController.stream.transform(Validator().emailValidator);
  }
  bool visibility=true;

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(ChangeVisibilityState());
  }



  // Method to check if an email is valid
  Future<bool> isValidEmail(String email) async {
    // Add the email to the stream
    emailController.add(email);

    // Listen for validation result
    bool isValid = false;
    await validatedEmailStream.firstWhere((result) {
      // Handle the result
      isValid = true; // or false based on validation
      return true; // Stop listening after the first result
    }).catchError((error) {
      // Handle errors if any
      isValid = false;
    });
    return isValid;
  }
}



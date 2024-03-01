import 'dart:async';
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/base/validator.dart';
import 'package:lms/core/network/network.dart';

import '../data/model/user.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  late StreamController<String> emailController;
  late Stream<String> validatedEmailStream;
  bool visibility = true;
  bool check = true;

  LoginCubit() : super(InitialLoginState()) {
    // Initialize the email controller
    emailController = StreamController<String>();

    // Connect the emailValidator to your email stream
    validatedEmailStream =
        emailController.stream.transform(Validator().emailValidator);
  }

  void changeCheck() {
    check = !check;

    emit(ChangeCheckState());
  }

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

  Future<bool> sgin_In(String email, String password) async {
    bool flag = false;
    try {
      Response response = await NetworkHelper.instance.post(
        endPoint: EndPoints.LOGIN,
        params: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        User.fromJson(response.data);
        flag = true;
      }
    } catch (e) {
      print(e);
    }

    return flag;
  }
}

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/navigation/app_routes.dart';
import 'package:lms/core/navigation/navigation_helper.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/caching/caching_key.dart';
import '../../../core/caching/shared_helper.dart';
import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginStates> {
  final email = BehaviorSubject<String?>();
  final password = BehaviorSubject<String?>();
  bool visibility = true;
  bool check = true;
  static LoginCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  LoginCubit() : super(Unauthenticated());

  Function(String?) get updateEmail => email.sink.add;

  Function(String?) get updatePassword => password.sink.add;

  Stream<String?> get emailStream => email.stream.asBroadcastStream();

  Stream<String?> get passwordStream => password.stream.asBroadcastStream();

  void changePasswordVisibility() {
    visibility = !visibility;
    emit(Unauthenticated());
  }

  void changeCheck(bool? value) {
    check = value!;
    emit(Unauthenticated());
  }

  clear() {
    updateEmail(null);
    updatePassword(null);
  }

  @override
  Future<void> close() {
    email.close();
    password.close();
    return super.close();
  }

  void login() async {
    emit(Unauthenticated());
    if (await email.isEmpty) {
      return;
    }
    try {
      var user = await LoginRepo.login(
        password: password.valueOrNull,
        username: email.valueOrNull,
      );
      if (user.accessToken != null) {
        SharedHelper.instance!.writeData(
          CachingKey.TOKEN,
          user.accessToken,
        );
        SharedHelper.instance!.writeData(CachingKey.IS_LOGIN, true);
        SharedHelper.instance!.writeData(
          CachingKey.USER,
          json.encode(user.toJson()),
        );
        print(user.accessToken);
        NavigationHelper.navigateToReplacement(AppRoute.HOME);
        clear();
        emit(Authenticated());
      } else {
        // tell the user there is something wrong
        emit(Unauthenticated());
      }
    } catch (e) {
      // tell the user the authentication failed
      emit(AuthenticationFailed());
    }
  }
}

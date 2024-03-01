import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/caching/caching_key.dart';
import 'package:lms/core/helpers/navigation_helper.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/core/utils/app_routes.dart';
import 'package:lms/features/Login/cubit/login_cubit.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import 'package:lms/features/Login/view/widgets/CustomTextFormField.dart';
import 'package:lms/features/Login/view/widgets/row_remember_and_froget.dart';
import 'package:lms/features/Login/view/widgets/row_create_account.dart';
import 'package:lms/features/Login/view/widgets/sign_in_button.dart';

import '../../../../core/caching/shared_helper.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final formSignInKey = GlobalKey<FormState>();
    final TextEditingController email = TextEditingController(),
        password = TextEditingController();
    _setDataFromSharedHelper(email, password);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Padding(
          padding: EdgeInsets.only(top: 175.h),
          child: Container(
            height: 733.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r)),
              color: AppColors.white,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
              child: Form(
                key: formSignInKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextForm(
                        controller: email,
                        hint: 'Enter Email Address',
                        obscure: false,
                        validatorText: 'Please Enter Email',
                        textAuth: 'Email Address',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: CustomTextForm(
                          controller: password,
                          hint: 'Enter Password',
                          obscure: cubit.visibility,
                          validatorText: 'Please enter Password',
                          icon: cubit.visibility
                              ? AppIcons.eye
                              : AppIcons.eye_slash,
                          onPressed: () => {cubit.changePasswordVisibility()},
                          textAuth: 'Password',
                        ),
                      ),
                      RememberAndForget(
                        check: cubit.check,
                        onTap: () => cubit.changeCheck(),
                      ),
                      SignInButton(onTap: () async {
                        if (formSignInKey.currentState!.validate()) {
                          if (await cubit.sgin_In(
                              email.value.text, password.value.text)) {
                            if (cubit.check) {
                              _setDataInSharedHelper(
                                  email.value.text, email.value.text);
                            }
                            NavigationHelper.navigateToReplacement(
                                AppRoute.HOME);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('"Invalid credentials'),
                              ),
                            );
                          }
                        }
                      }),
                      const RowCreateAccount()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _setDataFromSharedHelper(
      TextEditingController email, TextEditingController password) {
    email.text = SharedHelper.instance!.readString(CachingKey.USER_EMAIL);
    password.text = SharedHelper.instance!.readString(CachingKey.USER_PASSWORD);
  }

  void _setDataInSharedHelper(String email, String password) {
    SharedHelper.instance!.writeData(CachingKey.USER_EMAIL, email);
    SharedHelper.instance!.writeData(CachingKey.USER_PASSWORD, password);
  }
}

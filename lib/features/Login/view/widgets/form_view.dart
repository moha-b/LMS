import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/helpers/validation_helper.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/Login/cubit/login_cubit.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import 'package:lms/features/Login/view/widgets/CustomTextFormField.dart';
import 'package:lms/features/Login/view/widgets/row_create_account.dart';
import 'package:lms/features/Login/view/widgets/row_remember_and_froget.dart';
import 'package:lms/features/Login/view/widgets/sign_in_button.dart';

class FormView extends StatelessWidget {
  FormView({super.key});

  final formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 175.h),
      child: Container(
        height: 733.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
          color: AppColors.white,
        ),
        child: BlocBuilder<LoginCubit, LoginStates>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
              child: Form(
                key: formSignInKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      StreamBuilder<String?>(
                          stream: LoginCubit.instance.emailStream,
                          builder: (context, snapshot) {
                            return CustomTextForm(
                              hint: 'Enter Email Address',
                              validator:
                                  ValidationHelper.instance.validateEmail,
                              textAuth: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              onChanged: LoginCubit.instance.updateEmail,
                            );
                          }),
                      SizedBox(height: 16.h),
                      StreamBuilder<String?>(
                          stream: LoginCubit.instance.passwordStream,
                          builder: (context, snapshot) {
                            return CustomTextForm(
                              hint: 'Enter Password',
                              onChanged: LoginCubit.instance.updatePassword,
                              obscure: LoginCubit.instance.visibility,
                              validator:
                                  ValidationHelper.instance.validatePassword,
                              icon: LoginCubit.instance.visibility
                                  ? AppIcons.eye
                                  : AppIcons.eye_slash,
                              onPressed: () => LoginCubit.instance
                                  .changePasswordVisibility(),
                              textAuth: 'Password',
                            );
                          }),
                      SizedBox(height: 16.h),
                      RememberAndForget(
                        check: LoginCubit.instance.check,
                        onChanged: LoginCubit.instance.changeCheck,
                      ),
                      SignInButton(
                        onTap: () {
                          if (formSignInKey.currentState!.validate()) {
                            LoginCubit.instance.login();
                          }
                        },
                      ),
                      const RowCreateAccount()
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

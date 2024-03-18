import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/helpers/validation_helper.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/Login/cubit/login_cubit.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import 'package:lms/features/Login/view/widgets/CustomTextFormField.dart';
import 'package:lms/features/Login/view/widgets/row_create_account.dart';
import 'package:lms/features/Login/view/widgets/row_remember_and_froget.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  final formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

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
                        stream: loginCubit.emailStream,
                        builder: (context, snapshot) {
                          return CustomTextForm(
                            hint: 'Enter Email Address',
                            validator: ValidationHelper.instance.validateEmail,
                            textAuth: 'Email Address',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: loginCubit.updateEmail,
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      StreamBuilder<String?>(
                        stream: loginCubit.passwordStream,
                        builder: (context, snapshot) {
                          return CustomTextForm(
                            hint: 'Enter Password',
                            onChanged: loginCubit.updatePassword,
                            obscure: loginCubit.visibility,
                            validator:
                                ValidationHelper.instance.validatePassword,
                            icon: loginCubit.visibility
                                ? AppIcons.eye
                                : AppIcons.eye_slash,
                            onPressed: () =>
                                loginCubit.changePasswordVisibility(),
                            textAuth: 'Password',
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                      RememberAndForget(
                        check: loginCubit.check,
                        onChanged: loginCubit.changeCheck,
                      ),
                      if (state is LoadingState)
                        Padding(
                          padding: EdgeInsets.only(top: 48.h, bottom: 24.h),
                          child: const CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(top: 48.h, bottom: 24.h),
                          child: PrimaryButton(
                            onTap: () {
                              if (formSignInKey.currentState!.validate()) {
                                loginCubit.login();
                              }
                            },
                            text: 'Sign In',
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            width: 327.w,
                            height: 56.h,
                          ),
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

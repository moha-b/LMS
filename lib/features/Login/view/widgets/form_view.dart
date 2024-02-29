import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/Login/cubit/login_cubit.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import 'package:lms/features/Login/view/widgets/CustomTextFormField.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final formSignInKey = GlobalKey<FormState>();
    bool rememberPassword = false;
    final TextEditingController email = TextEditingController(),
        password = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
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
                        label: 'Email',
                        hint: 'Enter Email Address',
                        obscure: false,
                        validatorText: 'Please Enter Email',
                        textAuth: 'Email Address',
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: CustomTextForm(
                          controller: password,
                          label: 'Password',
                          hint: 'Enter Password',
                          obscure: context.read<LoginCubit>().visibility,
                          validatorText: 'Please enter Password',
                          icon: context.read<LoginCubit>().visibility
                              ? AppIcons.eye
                              : AppIcons.eye_slash,
                          onPressed: () => {
                            context
                                .read<LoginCubit>()
                                .changePasswordVisibility()
                          },
                          textAuth: 'Password',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<LoginCubit>().changeCheck();
                                },
                                child: SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Center(
                                    child: context.watch<LoginCubit>().check
                                        ? Checkbox(
                                            value: context
                                                .watch<LoginCubit>()
                                                .check,
                                            onChanged: (value) {
                                              context
                                                  .read<LoginCubit>()
                                                  .changeCheck();
                                            },
                                            activeColor: AppColors.primary,
                                            checkColor: Colors.white,
                                          )
                                        : Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              border: Border.all(
                                                color: AppColors.gray200,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: AppColors.black800,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 48.h, bottom: 24.h),
                        child: GestureDetector(
                          onTap: () {
                            if (formSignInKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 327.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.primary,
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New on our platform? ',
                            style: TextStyle(
                              color: AppColors.gray600,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}

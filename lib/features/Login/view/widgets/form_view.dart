import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/Login/cubit/login_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../../cubit/login_cubit.dart';
import 'CustomTextFormField.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formSignInKey = GlobalKey<FormState>();
    final bool rememberPassword = false;
    final TextEditingController email = TextEditingController(),
        password = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 155.h),
          child: SingleChildScrollView(
            child: Container(
              height: 700.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.h),
                    topRight: Radius.circular(25.h)),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),

                      CustomTextForm(
                          controller: email,
                          label: 'Email',
                          hint: 'Enter Email',
                          obscure: false,
                          validatorText: 'Please Enter Email'),
                      SizedBox(
                        height: 25.h,
                      ),

                      CustomTextForm(
                        controller: password,
                        label: 'Password',
                        hint: 'Enter Password',
                        obscure: context.read<LoginCubit>().visibility,
                        validatorText: 'Please enter Password',
                        icon: context.read<LoginCubit>().visibility
                            ? AppIcons.eye
                            : AppIcons.eye_slash,
                        OnPressed: () => {
                          context.read<LoginCubit>().changePasswordVisibility()
                        },
                      ),

                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {},
                                activeColor: AppColors.primary,
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formSignInKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25.h,
                      ),

                      // don't have an account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'New on our platform? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
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

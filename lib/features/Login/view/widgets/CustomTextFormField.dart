import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.label,
    required this.hint,
    required this.obscure,
    required this.validatorText,
    required this.controller,
    this.icon,
    this.onPressed,
    required this.textAuth,
  });

  final String label, hint, validatorText;
  final bool obscure;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String textAuth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAuth,
          style: TextStyle(
            color: AppColors.gray900,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscure,
          obscuringCharacter: '*',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorText;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                size: 20.sp,
                color: AppColors.gray400,
              ),
              onPressed: onPressed,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.gray300,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.gray200,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }
}

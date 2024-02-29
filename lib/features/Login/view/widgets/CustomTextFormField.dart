import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {super.key,
      required this.label,
      required this.hint,
      required this.obscure,
      required this.validatorText,
      required this.controller,
      this.icon=null,
        this.OnPressed
      });

  final String label, hint, validatorText;
  final bool obscure;
  final TextEditingController controller;
  final IconData? icon;
  final  VoidCallback? OnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

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
        label: Text(
          label,
          style: TextStyle(color: AppColors.primary),

        ),
        suffixIcon:IconButton(icon:Icon(icon),onPressed: OnPressed),
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.gray300,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary, // Default border color
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.black, // Default border color
          ),
          borderRadius: BorderRadius.circular(10.h),
        ),
      ),
    );
  }
}

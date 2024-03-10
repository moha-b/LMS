import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class RememberAndForget extends StatelessWidget {
  const RememberAndForget({super.key, this.onChanged, required this.check});
  final void Function(bool?)? onChanged;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: check,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                checkColor: Colors.white,
              ),
              Text(
                "Remember me",
                style: TextStyle(
                  color: AppColors.black800,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => print("Forgot Password?"),
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
    );
  }
}

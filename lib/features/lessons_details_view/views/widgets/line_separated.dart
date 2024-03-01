import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';

class LineSeparated extends StatelessWidget {
  const LineSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      width: 327.w,
      color: AppColors.gray200,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';

class CustomAppBarTheme extends AppBarTheme {
  CustomAppBarTheme._()
      : super(
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColors.blue900,
            ),
            iconTheme: const IconThemeData(color: AppColors.blue700),
            backgroundColor: AppColors.white);

  static final CustomAppBarTheme instance = CustomAppBarTheme._();
}

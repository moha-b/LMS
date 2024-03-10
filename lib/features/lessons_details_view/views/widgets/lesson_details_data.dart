import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';

class LessonDetailsData extends StatelessWidget {
  LessonDetailsData(
      {super.key, required this.onTap, required this.icon, required this.text});

  void Function()? onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: AppColors.gray600,
          ),
          SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.gray600,
            ),
          ),
          SizedBox(width: 8.h),
        ],
      ),
    );
  }
}

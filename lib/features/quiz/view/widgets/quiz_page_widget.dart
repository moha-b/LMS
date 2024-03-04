import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why People about skills required to be an Effective manager?",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.gray900),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 146.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1, color: AppColors.gray200),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "Answers",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.gray400),
          ),
        ],
      ),
    );
  }
}

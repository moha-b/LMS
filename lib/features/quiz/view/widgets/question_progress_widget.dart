import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/course_view/view/widgets/widgets.dart';
import '../../../../core/utils/app_colors.dart';

class QuestionProgress extends StatelessWidget {
  const QuestionProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "QUESTION 3 of 300",
            style: TextStyle(
              color: AppColors.gray900,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          LinearProgressIndicator(
            color: AppColors.primary,
            value: 0.3,
            borderRadius: BorderRadius.circular(19.r),
            minHeight: 5.h,
          ),
          LineSeparated(),
        ],
      ),
    );
  }
}

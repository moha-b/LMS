import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/course_view/view/widgets/widgets.dart';
import '../../../../core/utils/app_colors.dart';

class QuestionProgress extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuestionProgress({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestion) / totalQuestions;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "QUESTION $currentQuestion of $totalQuestions",
            style: TextStyle(
              color: AppColors.gray900,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          LinearProgressIndicator(
            color: AppColors.primary,
            value: progress,
            borderRadius: BorderRadius.circular(19.r),
            minHeight: 5.h,
          ),
          const LineSeparated(),
        ],
      ),
    );
  }
}

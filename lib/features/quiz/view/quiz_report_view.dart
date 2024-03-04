import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/quiz/view/widgets/quiz_statistics_widget.dart';
import 'package:lms/features/quiz/view/widgets/success_widget.dart';

import '../../../core/utils/app_icons.dart';

class QuizReportView extends StatelessWidget {
  const QuizReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz Report'),
      body: Column(
        children: [
          const SuccessWidget(),
          SizedBox(height: 24.h),
          Text(
            "Your Score",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.gray400,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                    child: QuizStatistics(
                  onTap: () {},
                  icon: AppIcons.copy_success,
                  total: '80',
                  description: 'Right Answers',
                )),
                SizedBox(width: 16.w),
                Expanded(
                    child: QuizStatistics(
                  onTap: () {},
                  icon: AppIcons.clipboard_close,
                  total: '20',
                  description: 'Wrong Answers',
                )),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Try again button in case the failure widget display
          if (false)
            PrimaryButton(
              onTap: () {},
              color: AppColors.gray100,
              height: 40.h,
              width: 261.w,
              text: 'Try Again',
              textColor: AppColors.gray900,
              haveIcon: true,
              icon: AppIcons.refresh_circle,
              sizeBetweenIconAndText: 20.w,
              iconColor: AppColors.gray900,
            ),
        ],
      ),
      floatingActionButton: PrimaryButton(
        onTap: () {},
        height: 45.h,
        width: 137.w,
        text: 'Quiz Report',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        borderRadius: 40.r,
        haveIcon: true,
        iconToRight: true,
        icon: AppIcons.arrow_right_3,
        iconSize: 14.sp,
      ),
    );
  }
}

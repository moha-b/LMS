import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/quiz/view/widgets/quiz_info_widget.dart';

import '../../../core/utils/app_icons.dart';

class QuizInfoView extends StatelessWidget {
  const QuizInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quiz'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Test Your Knowledge On User Pain Points",
              style: TextStyle(
                color: AppColors.gray900,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "People about skills and activities required to bean effective video editor",
              style: TextStyle(
                color: AppColors.gray600,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                const Expanded(
                  child: QuizInfoWidget(
                    icon: AppIcons.document_text_1,
                    title: "Questions",
                    content: "500",
                  ),
                ),
                SizedBox(width: 16.w),
                const Expanded(
                  child: QuizInfoWidget(
                    icon: AppIcons.archive_tick,
                    title: "Min score",
                    content: "130",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(24),
        height: 150.h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your grade",
                  style: TextStyle(
                    color: AppColors.gray900,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "---",
                  style: TextStyle(
                    color: AppColors.gray900,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              onTap: () {},
              text: "Start Quiz",
              fontWeight: FontWeight.w600,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

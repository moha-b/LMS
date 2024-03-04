import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/quiz/bloc/quiz_cubit.dart';
import 'package:lms/features/quiz/view/widgets/question_progress_widget.dart';
import 'package:lms/features/quiz/view/widgets/quiz_page_widget.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Test Your Knowledge On User...'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const QuestionProgress(),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: QuizCubit.instance.pageController,
              onPageChanged: (value) => QuizCubit.instance.onPageChanged,
              itemBuilder: (context, index) => QuizPage(),
              itemCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  onTap: () => QuizCubit.instance.previousPage(),
                  text: 'Previous',
                  color: AppColors.white,
                  haveIcon: true,
                  icon: AppIcons.arrow_left,
                  iconColor: AppColors.primary,
                ),
                PrimaryButton(
                  onTap: () => QuizCubit.instance.nextPage(),
                  width: 108.w,
                  text: 'Next',
                  haveIcon: true,
                  iconToRight: true,
                  icon: AppIcons.arrow_right_1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

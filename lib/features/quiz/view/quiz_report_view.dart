import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/quiz/bloc/quiz_cubit.dart';
import 'package:lms/features/quiz/view/widgets/failure_widget.dart';
import 'package:lms/features/quiz/view/widgets/quiz_statistics_widget.dart';
import 'package:lms/features/quiz/view/widgets/success_widget.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

import '../../../core/utils/app_icons.dart';

class QuizReportView extends StatelessWidget {
  QuizReportView(
      {super.key, required this.totalQuestions, required this.codeData});

  final int totalQuestions;
  final int codeData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit()..fetchQuizReportQuestions(codeData),
      child: BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
        if (state is QuizReoprtSuccess) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Quiz Report',
              onPressed: () => NavigationHelper.navigateTo(AppRoute.HOME),
            ),
            body: Column(
              children: [
                state.quizReport.success == 1
                    ? const SuccessWidget()
                    : const FailureWidget(),
                SizedBox(height: 24.h),
                Text(
                  "Your Score",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.gray400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 40.h),
                  child: SemicircularIndicator(
                    color: state.quizReport.success == 1
                        ? AppColors.success900
                        : AppColors.secondary,
                    bottomPadding: 13.5.h,
                    radius: 110.r,
                    progress: state.quizReport.score / 100,
                    strokeWidth: 20.w,
                    strokeCap: StrokeCap.round,
                    child: Column(
                      children: [
                        Text(
                          '${state.quizReport.score}%',
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: state.quizReport.success == 1
                                ? AppColors.success900
                                : AppColors.secondary,
                          ),
                        ),
                        Text(
                          '${state.quizReport.correctAnswersCount} out of ${totalQuestions}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: QuizStatistics(
                        onTap: () {},
                        icon: AppIcons.copy_success,
                        total: state.quizReport.correctAnswersCount.toString(),
                        description: 'Right Answers',
                      )),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: QuizStatistics(
                        onTap: () {},
                        icon: AppIcons.clipboard_close,
                        total: (totalQuestions -
                                state.quizReport.correctAnswersCount)
                            .toString(),
                        description: 'Wrong Answers',
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
            floatingActionButton: PrimaryButton(
              onTap: () {
                NavigationHelper.navigateTo(AppRoute.HOME);
              },
              height: 45.h,
              width: 137.w,
              text: 'Go To Home',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              borderRadius: 40.r,
              haveIcon: true,
              iconToRight: true,
              icon: AppIcons.arrow_right_3,
              iconSize: 14.sp,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

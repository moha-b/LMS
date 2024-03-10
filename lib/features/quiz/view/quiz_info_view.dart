import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/quiz/bloc/quiz_cubit.dart';
import 'package:lms/features/quiz/view/widgets/quiz_info_widget.dart';

import '../../../core/utils/app_icons.dart';
import '../data/model/quiz.dart';

class QuizInfoView extends StatelessWidget {
  QuizInfoView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit()..fetchQuiz(id),
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizSuccess) {
            Quiz quiz = state.quiz;
            return Scaffold(
              appBar: const CustomAppBar(title: 'Quiz'),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.title,
                      style: TextStyle(
                        color: AppColors.gray900,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      quiz.description,
                      style: TextStyle(
                        color: AppColors.gray600,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: QuizInfoWidget(
                            icon: AppIcons.document_text_1,
                            title: "Questions",
                            content: quiz.questionsCount.toString(),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: QuizInfoWidget(
                            icon: AppIcons.archive_tick,
                            title: "Min score",
                            content: quiz.minScore.toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomSheet: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
                height: 155.h,
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
                      onTap: () {
                        print('${quiz.id} wwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                        NavigationHelper.navigateToReplacement(AppRoute.QUIZ,
                            arguments: quiz.id);
                      },
                      text: "Start Quiz",
                      fontWeight: FontWeight.w600,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

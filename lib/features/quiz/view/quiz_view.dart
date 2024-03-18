import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/quiz/bloc/quiz_buttons_cubit.dart';
import 'package:lms/features/quiz/bloc/quiz_cubit.dart';
import 'package:lms/features/quiz/view/widgets/question_progress_widget.dart';
import 'package:lms/features/quiz/view/widgets/quiz_page_widget.dart';

import '../data/model/question.dart';
import '../data/model/submit_exam.dart';

class QuizView extends StatelessWidget {
  QuizView({Key? key, required this.id}) : super(key: key);
  final int id;
  int? codeData;
  Map<String, String> options = Map();
  DateTime startTime = DateTime.now();
  int Index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit()..fetchQuizQuestions(id),
        ),
        BlocProvider(
          create: (context) => QuizButtonsCubit(),
        ),
      ],
      child: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuestionSuccess) {
            List<Question> question = state.question;
            return Scaffold(
              appBar:
                  const CustomAppBar(title: 'Test Your Knowledge On User...'),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<QuizButtonsCubit, QuizButtonsState>(
                    builder: (context, state) {
                      if (state is QuizNextPage || state is QuizPreviousPage) {
                        return QuestionProgress(
                          currentQuestion:
                              context.read<QuizButtonsCubit>().currentPage,
                          totalQuestions: question.length,
                        );
                      }
                      return QuestionProgress(
                        currentQuestion:
                            context.read<QuizButtonsCubit>().currentPage,
                        totalQuestions: question.length,
                      );
                    },
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller:
                          context.read<QuizButtonsCubit>().pageController,
                      // onPageChanged: (value) => QuizCubit.instance.onPageChanged,
                      itemBuilder: (context, index) {
                        Index = index;
                        return QuizPage(
                          question: question[index],
                          options: options,
                        );
                      },
                      itemCount: question.length,
                    ),
                  ),
                  BlocBuilder<QuizButtonsCubit, QuizButtonsState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            context.read<QuizButtonsCubit>().currentPage != 1
                                ? PrimaryButton(
                                    onTap: () => context
                                        .read<QuizButtonsCubit>()
                                        .previousPage(),
                                    text: 'Previous',
                                    color: AppColors.white,
                                    haveIcon: true,
                                    icon: AppIcons.arrow_left,
                                    iconColor: AppColors.primary,
                                  )
                                : const SizedBox.shrink(),
                            context.read<QuizButtonsCubit>().currentPage !=
                                    question.length
                                ? PrimaryButton(
                                    onTap: () {
                                      context
                                          .read<QuizButtonsCubit>()
                                          .nextPage(question.length);
                                    },
                                    width: 108.w,
                                    text: 'Next',
                                    haveIcon: true,
                                    iconToRight: true,
                                    icon: AppIcons.arrow_right_1,
                                  )
                                : PrimaryButton(
                                    onTap: () {
                                      SubmitExam exam = SubmitExam(
                                        id: id,
                                        options: options,
                                        startDate: startTime.toString(),
                                        endDate: DateTime.now().toString(),
                                      );
                                      context
                                          .read<QuizCubit>()
                                          .postExam(exam, question.length);
                                    },
                                    width: 150.w,
                                    text: 'View Report',
                                    haveIcon: true,
                                    iconToRight: true,
                                    icon: AppIcons.arrow_right_1,
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

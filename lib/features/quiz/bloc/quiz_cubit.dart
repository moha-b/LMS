import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/quiz/data/question.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/network/network.dart';
import '../data/exam.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final PageController pageController = PageController();
  int currentPage = 1;

  static QuizCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  QuizCubit() : super(QuizInitial());

  void onPageChanged(int value) {
    currentPage = value;
  }

  void fetchQuiz(quizId) async {
    emit(QuizInitial());
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.Quiz,
        params: {
          "id": "$quizId",
        },
      );
      var data = result.data['data'];
      Quiz quiz = Quiz.fromJson(data);
      print('${quiz.title} qqqqqqqqqqqqqqqqqqqqqqqqqq');
      emit(QuizSuccess(quiz));
    } catch (e) {
      print(e.toString());
      emit(QuizError(e.toString()));
    }
  }

  void fetchQuizQuestions(quizId) async {
    emit(QuizInitial());
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.Questions,
        params: {
          "exam_id": "$quizId",
        },
      );
      var data = result.data['data'];
      List<Question> question = Question.fromJsonList(data);
      print('${question[0].title} qqqqqqqqqqqqqqqqqqqqqqqqqq');
      emit(QuestionSuccess(question));
    } catch (e) {
      print(e.toString());
      emit(QuizError(e.toString()));
    }
  }

  void nextPage(max) {
    if (currentPage < max) {
      currentPage++;
      emit(QuizNextPage());
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    print(currentPage);
  }

  void previousPage() {
    if (currentPage > 1) {
      currentPage--;
      emit(QuizPreviousPage());
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    print(currentPage);
  }
}

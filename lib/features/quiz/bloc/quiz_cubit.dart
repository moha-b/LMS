import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/quiz/data/question.dart';
import 'package:lms/features/quiz/data/quiz_report.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/network/network.dart';
import '../data/exam.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final PageController pageController = PageController();

  static QuizCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  QuizCubit() : super(QuizInitial());

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

  void fetchQuizReportQuestions(studentExamId) async {
    emit(QuizInitial());
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.QuizReport,
        params: {
          "student_exam_id": "$studentExamId",
        },
      );
      print('wwwwwwwwwwwwwwwwwwwwwwwwwwww');
      var data = result.data['data'];
      QuizReport quizReport = QuizReport.fromJson(data);
      emit(QuizReoprtSuccess(quizReport));
    } catch (e) {
      print(e.toString());
      emit(QuizError(e.toString()));
    }
  }
}

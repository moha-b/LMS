import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/quiz/data/model/question.dart';
import 'package:lms/features/quiz/data/model/quiz_report.dart';
import 'package:lms/features/quiz/data/model/submit_exam.dart';
import 'package:lms/features/quiz/data/repo/quiz_repo.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/network/network.dart';
import '../data/model/quiz.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final PageController pageController = PageController();

  static QuizCubit get instance =>
      BlocProvider.of(NavigationHelper.navigatorKey.currentContext!);

  QuizCubit() : super(QuizInitial());

  void fetchQuiz(quizId) async {
    emit(QuizInitial());
    dynamic data =
        await QuizRepo.fetchData(quizId, "id", EndPoints.Quiz, Quiz());
    data is String ? emit(QuizError(data)) : emit(QuizSuccess(data));
  }

  void fetchQuizQuestions(quizId) async {
    emit(QuizInitial());
    List<dynamic>? data = await QuizRepo.fetchListOfQuestions(
        quizId, "exam_id", EndPoints.Questions);
    data is String
        ? emit(QuizError(data?[0]))
        : emit(QuestionSuccess(data as List<Question>));
  }

  void fetchQuizReportQuestions(studentExamId) async {
    emit(QuizInitial());
    dynamic data = await QuizRepo.fetchData(
        studentExamId, "student_exam_id", EndPoints.QuizReport, QuizReport());
    data is String ? emit(QuizError(data)) : emit(QuizReoprtSuccess(data));
  }

  void postExam(SubmitExam exam) async {
    await QuizRepo.postExam(exam);
  }
}

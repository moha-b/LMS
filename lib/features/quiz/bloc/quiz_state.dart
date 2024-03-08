part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizSuccess extends QuizState {
  Quiz quiz;

  QuizSuccess(this.quiz);
}

class QuizReoprtSuccess extends QuizState {
  QuizReport quizReport;

  QuizReoprtSuccess(this.quizReport);
}

class QuestionSuccess extends QuizState {
  List<Question> question;

  QuestionSuccess(this.question);
}

class QuizError extends QuizState {
  String error;

  QuizError(this.error);
}

part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizNextPage extends QuizState {}

class QuizPreviousPage extends QuizState {}

class QuizSuccess extends QuizState {
  Quiz quiz;

  QuizSuccess(this.quiz);
}

class QuestionSuccess extends QuizState {
  List<Question> question;

  QuestionSuccess(this.question);
}

class QuizError extends QuizState {
  String error;

  QuizError(this.error);
}

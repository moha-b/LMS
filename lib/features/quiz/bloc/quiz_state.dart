part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizNextPage extends QuizState {}

class QuizPreviousPage extends QuizState {}

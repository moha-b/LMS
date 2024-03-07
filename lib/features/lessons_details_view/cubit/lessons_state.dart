part of 'lessons_cubit.dart';

@immutable
abstract class LessonsState {}

class LessonsInitial extends LessonsState {}

class LessonsSuccess extends LessonsState {
  final LessonModel lesson;

  LessonsSuccess(this.lesson);
}

class LessonsError extends LessonsState {}

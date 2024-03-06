part of 'lessons_cubit.dart';

@immutable
abstract class LessonsState {}

class LessonsInitial extends LessonsState {}

class LessonsSuccess extends LessonsState {}

class LessonsError extends LessonsState {}

part of 'course_view_cubit.dart';

@immutable
abstract class CourseViewState {}

class CourseViewInitial extends CourseViewState {}

class CourseViewSuccessState extends CourseViewState {
  final Course data;

  CourseViewSuccessState(this.data);
}

class CourseViewFailedState extends CourseViewState {
  final String error;

  CourseViewFailedState(this.error);
}

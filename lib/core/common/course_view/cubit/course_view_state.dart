part of 'course_view_cubit.dart';

@immutable
abstract class CourseViewState {}

class CourseViewInitial extends CourseViewState {}

class CourseViewLoadingState extends CourseViewState {}

class CourseViewSuccessState extends CourseViewState {
  final Course data;

  CourseViewSuccessState(this.data);
}

class CourseViewFailedState extends CourseViewState {
  final String error;

  CourseViewFailedState(this.error);
}

class CourseViewRelatedLoadingState extends CourseViewState {}

class CourseViewRelatedSuccessState extends CourseViewState {
  final Course data;

  CourseViewRelatedSuccessState(this.data);
}

class CourseViewRelatedFailedState extends CourseViewState {
  final String error;

  CourseViewRelatedFailedState(this.error);
}

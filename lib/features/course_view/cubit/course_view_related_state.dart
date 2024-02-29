part of 'course_view_related_cubit.dart';

@immutable
abstract class CourseViewRelatedState {}

class CourseViewRelatedInitial extends CourseViewRelatedState {}

class CourseViewRelatedSuccessState extends CourseViewRelatedState {
  final Course data;

  CourseViewRelatedSuccessState(this.data);
}

class CourseViewRelatedFailedState extends CourseViewRelatedState {
  final String error;

  CourseViewRelatedFailedState(this.error);
}

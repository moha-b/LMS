part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class FetchCourses extends CoursesEvent {}

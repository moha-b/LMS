part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();
}

class CoursesInitial extends CoursesState {
  @override
  List<Object> get props => [];
}

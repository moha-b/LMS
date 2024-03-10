part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();
  @override
  List<Object> get props => [];
}

class CoursesSuccess extends CoursesState {
  final List<DataModel> data;

  const CoursesSuccess(this.data);
}

class CoursesInitial extends CoursesState {}

class CoursesError extends CoursesState {}

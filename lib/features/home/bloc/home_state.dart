part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final CoursesModel data;

  const HomeSuccess(this.data);
}

class HomeFailure extends HomeState {}

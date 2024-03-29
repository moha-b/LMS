part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class FetchCourses extends HomeEvent {}

class FetchAds extends HomeEvent {}

class FetchAllTracks extends HomeEvent {}

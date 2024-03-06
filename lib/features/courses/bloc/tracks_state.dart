part of 'tracks_bloc.dart';

@immutable
abstract class TracksState {}

class TracksInitial extends TracksState {}

class TracksSuccess extends TracksState {
  final TrackData track;

  TracksSuccess(this.track);
}

class TracksError extends TracksState {}

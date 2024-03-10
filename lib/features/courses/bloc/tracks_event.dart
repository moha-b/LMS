part of 'tracks_bloc.dart';

@immutable
abstract class TracksEvent {}

class SelectedTrack extends TracksEvent {
  final int id;

  SelectedTrack(this.id);
}

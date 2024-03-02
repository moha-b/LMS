part of 'home_bloc.dart';

enum RequestState {
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final CoursesModel? courses;
  final AdsModel? ads;
  final AllTracksModel? allTracks;
  final RequestState coursesState;
  final RequestState adsState;
  final RequestState allTracksState;
  final String coursesMessage;
  final String adsMessage;
  final String allTracksMessage;

  const HomeState({
    this.courses,
    this.ads,
    this.allTracks,
    this.coursesState = RequestState.loading,
    this.adsState = RequestState.loading,
    this.allTracksState = RequestState.loading,
    this.coursesMessage = '',
    this.adsMessage = '',
    this.allTracksMessage = '',
  });

  HomeState copyWith({
    CoursesModel? courses,
    AdsModel? ads,
    AllTracksModel? allTracks,
    RequestState? coursesState,
    RequestState? adsState,
    RequestState? allTracksState,
    String? coursesMessage,
    String? adsMessage,
    String? allTracksMessage,
  }) {
    return HomeState(
      courses: courses ?? this.courses,
      ads: ads ?? this.ads,
      allTracks: allTracks ?? this.allTracks,
      coursesState: coursesState ?? this.coursesState,
      adsState: adsState ?? this.adsState,
      allTracksState: allTracksState ?? this.allTracksState,
      coursesMessage: coursesMessage ?? this.coursesMessage,
      adsMessage: adsMessage ?? this.adsMessage,
      allTracksMessage: allTracksMessage ?? this.allTracksMessage,
    );
  }

  @override
  List<Object?> get props => [
        courses,
        ads,
        allTracks,
        coursesState,
        adsState,
        allTracksState,
        coursesMessage,
        adsMessage,
        allTracksMessage,
      ];
}

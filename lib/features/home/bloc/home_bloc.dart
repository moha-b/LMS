import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/repo/home_repo.dart';

import '../../../core/base/enums.dart';
import '../data/model/ads_model.dart';
import '../data/model/all_tracks_model.dart';
import '../data/model/course_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<FetchCourses>((event, emit) async {
      emit(state.copyWith(coursesState: RequestState.loading));
      try {
        var result = await repository.fetchCourses();
        result.fold(
          (l) => emit(state.copyWith(coursesState: RequestState.error)),
          (data) => emit(
              state.copyWith(coursesState: RequestState.loaded, courses: data)),
        );
      } catch (e) {
        print(e);
        emit(state.copyWith(coursesState: RequestState.error));
      }
    });

    on<FetchAds>((event, emit) async {
      emit(state.copyWith(adsState: RequestState.loading));
      try {
        var result = await repository.fetchAds();
        result.fold(
          (l) => emit(state.copyWith(adsState: RequestState.error)),
          (data) =>
              emit(state.copyWith(adsState: RequestState.loaded, ads: data)),
        );
      } catch (e) {
        print(e);
        emit(state.copyWith(adsState: RequestState.error));
      }
    });

    on<FetchAllTracks>((event, emit) async {
      emit(state.copyWith(allTracksState: RequestState.loading));
      try {
        var result = await repository.fetchAllTracks();
        result.fold(
          (l) => emit(state.copyWith(allTracksState: RequestState.error)),
          (data) => emit(state.copyWith(
              allTracksState: RequestState.loaded, allTracks: data)),
        );
      } catch (e) {
        print(e);
        emit(state.copyWith(allTracksState: RequestState.error));
      }
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/repo/home_repo.dart';

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
          (failure) => emit(state.copyWith(
              coursesState: RequestState.error,
              coursesMessage: failure?.message)),
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
          (failure) => emit(state.copyWith(
              adsState: RequestState.error, adsMessage: failure?.message)),
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
          (failure) => emit(state.copyWith(
            allTracksState: RequestState.error,
            allTracksMessage: failure?.message,
          )),
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

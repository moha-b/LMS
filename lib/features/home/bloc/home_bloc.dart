import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/data/model/course_model.dart';

import '../data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchCourses>((event, emit) async {
      emit(HomeInitial());
      try {
        var result = await repository.fetchCourses();
        result.fold(
            (l) => emit(HomeFailure()), (data) => emit(HomeSuccess(data)));
      } catch (e) {
        print(e);
        emit(HomeFailure());
      }
    });
    // on<HomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }
}

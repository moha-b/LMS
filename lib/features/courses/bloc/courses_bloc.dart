import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/courses/data/model.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(CoursesInitial()) {
    on<FetchCourses>((event, emit) async {
      try {
        var result =
            await NetworkHelper.instance.get(endPoint: EndPoints.TYPES);
        var json = result.data['data'] as List;
        var data = json
            .map<DataModel>((courseJson) => DataModel.fromJson(courseJson))
            .toList();
        emit(CoursesSuccess(data));
      } catch (e) {
        print(e.toString());
        emit(CoursesError());
      }
    });
  }
}

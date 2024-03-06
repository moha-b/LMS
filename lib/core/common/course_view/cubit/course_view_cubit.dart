import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lms/core/common/course_view/data/models/course_model.dart';
import 'package:lms/core/network/network.dart';
import 'package:meta/meta.dart';

import '../../../../features/home/bloc/home_bloc.dart';
import '../../../../features/home/data/model/course_model.dart';

part 'course_view_state.dart';

class CourseViewCubit extends Cubit<CourseViewState> {
  CourseViewCubit() : super(const CourseViewState());

  void fetchCoursesDetails(int id) async {
    emit(state.copyWith(courseState: RequestState.loading));
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.courseDetails(id));
      emit(state.copyWith(
          courseData: Course.fromJson(result.data),
          courseState: RequestState.loaded));
    } catch (e) {
      emit(state.copyWith(error: toString()));
    }
  }

  void fetchRelatedCoursesDetails(int id) async {
    try {
      emit(state.copyWith(relatedCoursesState: RequestState.loading));
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.relatedCourses,
        params: {
          "course_id": id,
          "limit": "10",
          "page": "1",
          "lang": "en",
        },
      );
      var json = result.data['data'] as List;
      var data = json
          .map<CourseModel>((courseJson) => CourseModel.fromJson(courseJson))
          .toList();
      emit(state.copyWith(
          relatedCoursesData: data, relatedCoursesState: RequestState.loaded));
    } catch (e) {
      print("LOOK AT THIS SUCRM $e");
      emit(state.copyWith(error: toString()));
    }
  }
}

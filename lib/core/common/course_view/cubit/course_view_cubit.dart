import 'package:bloc/bloc.dart';
import 'package:lms/core/common/course_view/data/models/course_model.dart';
import 'package:lms/core/network/network.dart';
import 'package:meta/meta.dart';

part 'course_view_state.dart';

class CourseViewCubit extends Cubit<CourseViewState> {
  CourseViewCubit() : super(CourseViewInitial());

  Future<Map<String, Course>?> fetchCoursesDetails(num id) async {
    emit(CourseViewLoadingState());
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.courseDetails(id));
      emit(CourseViewSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      emit(CourseViewFailedState(e.toString()));
    }
    return null;
  }

  Future<Map<String, Course>?> fetchRelatedCoursesDetails(num id) async {
    emit(CourseViewRelatedLoadingState());

    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.relatedCourses(id));
      emit(CourseViewRelatedSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      print(e);
      emit(CourseViewRelatedFailedState(e.toString()));
    }
    return null;
  }
}

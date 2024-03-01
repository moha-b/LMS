import 'package:bloc/bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/course_view/data/model/course_model.dart';
import 'package:meta/meta.dart';

part 'course_view_state.dart';

class CourseViewCubit extends Cubit<CourseViewState> {
  CourseViewCubit() : super(CourseViewInitial());

  Future<Map<String, Course>?> fetchCoursesDetails() async {
    emit(CourseViewLoadingState());
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.courseDetails(5));
      emit(CourseViewSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      emit(CourseViewFailedState(e.toString()));
    }
    return null;
  }

  Future<Map<String, Course>?> fetchRelatedCoursesDetails() async {
    emit(CourseViewRelatedLoadingState());

    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.relatedCourses(5));
      emit(CourseViewRelatedSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      print(e);
      emit(CourseViewRelatedFailedState(e.toString()));
    }
    return null;
  }
}

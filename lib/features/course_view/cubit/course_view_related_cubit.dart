import 'package:bloc/bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/course_view/data/model/course_model.dart';
import 'package:meta/meta.dart';

part 'course_view_related_state.dart';

class CourseViewRelatedCubit extends Cubit<CourseViewRelatedState> {
  CourseViewRelatedCubit() : super(CourseViewRelatedInitial());

  Future<Map<String, Course>?> fetchRelatedCoursesDetails() async {
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.relatedCourses(5));
      emit(CourseViewRelatedSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      print(e);
      emit(CourseViewRelatedFailedState(e.toString()));
    }
  }
}

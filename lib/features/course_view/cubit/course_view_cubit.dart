import 'package:bloc/bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/course_view/data/model/course_model.dart';
import 'package:meta/meta.dart';

part 'course_view_state.dart';

class CourseViewCubit extends Cubit<CourseViewState> {
  CourseViewCubit() : super(CourseViewInitial());

  Future<Map<String, Course>?> fetchCoursesDetails(num id) async {
    try {
      var result = await NetworkHelper.instance
          .get(endPoint: EndPoints.courseDetails(id));
      print(result);
      emit(CourseViewSuccessState(Course.fromJson(result.data)));
    } catch (e) {
      print(e);
      emit(CourseViewFailedState(e.toString()));
    }
  }
}

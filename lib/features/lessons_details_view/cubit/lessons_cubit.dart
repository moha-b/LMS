import 'package:bloc/bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:meta/meta.dart';

part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());

  void fetchLessons(lessonId) async {
    emit(LessonsInitial());
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: EndPoints.lessonDetails,
        params: {
          "course_id": "$lessonId",
        },
      );
      print(result);
      emit(LessonsSuccess());
    } catch (e) {
      print(e.toString());
      emit(LessonsError());
    }
  }
}

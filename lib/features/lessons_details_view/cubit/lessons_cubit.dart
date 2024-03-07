import 'package:bloc/bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/lessons_details_view/data/lesson_model.dart';
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
          "lesson_id": "$lessonId",
        },
      );
      var data = result.data['data'];
      var lesson = LessonModel.fromJson(data);
      print(lesson);
      emit(LessonsSuccess(lesson));
    } catch (e) {
      print(e.toString());
      emit(LessonsError());
    }
  }
}

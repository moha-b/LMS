import 'package:lms/features/quiz/data/model/exam.dart';
import 'package:lms/features/quiz/data/model/question.dart';

import '../../../../core/network/network.dart';
import '../model/submit_exam.dart';

class QuizRepo {
  static Future<dynamic> postExam(SubmitExam exam) async {
    try {
      var result = await NetworkHelper.instance.post(
        endPoint: EndPoints.SUBMITEXAM,
        params: {
          'exam_id': exam.id,
          'student_answers': exam.options,
          'start_date': exam.startDate,
          'end_date': exam.endDate
        },
        withToken: true,
      );
      print(result.data['data']);
      return result.data;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  static dynamic _fatch(int id, String nameId, String endPoint) async {
    try {
      var result = await NetworkHelper.instance.get(
        endPoint: endPoint,
        params: {
          "${nameId}": "$id",
        },
      );
      return result;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static dynamic fetchData(
      int id, String nameId, String endPoint, Exam exm) async {
    var result = await _fatch(id, nameId, endPoint);
    return result is String ? result : exm.fromJson(result.data['data']);
  }

  static Future<List<dynamic>?> fetchListOfQuestions(
      int id, String nameId, String endPoint) async {
    var result = await _fatch(id, nameId, endPoint);
    print(result);
    return result is String
        ? [result]
        : Question.fromJsonList(result.data['data']);
  }
}

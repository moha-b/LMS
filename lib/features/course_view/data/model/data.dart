import 'course_model.dart';

class Data {
  final Course courses;

  Data({
    required this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      courses: Course.fromJson(
          json['data'].map((course) => Course.fromJson(course))),
    );
  }
}

import 'course_model.dart';

class Data {
  final List<Course> courses;

  Data({
    required this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      courses: List<Course>.from(
          json['data'].map((course) => Course.fromJson(course))),
    );
  }
}

import 'package:lms/features/home/data/model/course_model.dart';

class TrackData {
  final int id;
  final String title;
  final String typeName;
  final String image;
  final List<CourseModel> courses;

  TrackData({
    required this.id,
    required this.title,
    required this.typeName,
    required this.image,
    required this.courses,
  });

  factory TrackData.fromJson(Map<String, dynamic> json) {
    return TrackData(
      id: json['id'] as int,
      title: json['title'] as String,
      typeName: json['type_name'] as String,
      image: json['image'] as String,
      courses: List<CourseModel>.from((json['courses'] as List<dynamic>)
          .map((course) => CourseModel.fromJson(course))),
    );
  }
}

import 'course_model.dart';

class Instructor {
  final int id;
  final String name;
  final String? lastName;
  final String image;
  final String? bio;
  final int studentCount;
  final List<Course> courses;
  final int coursesCount;

  Instructor({
    required this.id,
    required this.name,
    required this.lastName,
    required this.image,
    required this.bio,
    required this.studentCount,
    required this.courses,
    required this.coursesCount,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      image: json['image'],
      bio: json['bio'],
      studentCount: json['student_count'],
      courses: json['courses'] != null
          ? List<Course>.from(
              json['courses'].map((course) => Course.fromJson(course)))
          : [],
      coursesCount: json['courses_count'],
    );
  }
}

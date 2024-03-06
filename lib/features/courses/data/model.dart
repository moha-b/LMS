import 'package:lms/features/home/data/model/course_model.dart';

class DataModel {
  final int id;
  final String title;
  final String image;
  final List<Track> tracks;
  final List<CourseModel> courses;

  DataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.tracks,
    required this.courses,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      tracks: (json['tracks'] as List)
          .map((track) => Track.fromJson(track))
          .toList(),
      courses: (json['courses'] as List)
          .map((course) => CourseModel.fromJson(course))
          .toList(),
    );
  }
}

class Track {
  final int id;
  final String title;
  final String typeName;
  final String image;

  Track({
    required this.id,
    required this.title,
    required this.typeName,
    required this.image,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['title'],
      typeName: json['type_name'],
      image: json['image'],
    );
  }
}

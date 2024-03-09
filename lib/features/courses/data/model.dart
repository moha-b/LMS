import 'package:lms/features/home/data/model/all_tracks_model.dart';
import 'package:lms/features/home/data/model/course_model.dart';

class DataModel {
  final int id;
  final String title;
  final String image;
  final List<AllTracksModel> tracks;
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
          .map((track) => AllTracksModel.fromJson(track))
          .toList(),
      courses: (json['courses'] as List)
          .map((course) => CourseModel.fromJson(course))
          .toList(),
    );
  }
}

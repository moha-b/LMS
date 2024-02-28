import 'package:fpdart/fpdart.dart';
import 'package:lms/features/home/data/model/ads_model.dart';
import 'package:lms/features/home/data/model/all_tracks_model.dart';

import '../model/course_model.dart';

abstract class HomeRepository {
  Future<Either<String, CoursesModel>> fetchCourses();
  Future<Either<String, AdsModel>> fetchAds();
  Future<Either<String, AllTracksModel>> fetchAllTracks();
}

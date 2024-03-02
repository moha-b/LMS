import 'package:fpdart/fpdart.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/home/data/model/ads_model.dart';
import 'package:lms/features/home/data/model/all_tracks_model.dart';

import '../model/course_model.dart';

abstract class HomeRepository {
  Future<Either<Failure?, CoursesModel>> fetchCourses();
  Future<Either<Failure?, AdsModel>> fetchAds();
  Future<Either<Failure?, AllTracksModel>> fetchAllTracks();
}

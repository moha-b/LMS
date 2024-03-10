import 'package:fpdart/src/either.dart';
import 'package:lms/features/home/data/model/ads_model.dart';
import 'package:lms/features/home/data/model/all_tracks_model.dart';
import 'package:lms/features/home/data/model/course_model.dart';
import 'package:lms/features/home/data/repo/home_repo.dart';

import '../../../../core/network/network.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either<Failure?, List<CourseModel>>> fetchCourses() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.HOME_COURSES);
      var json = result.data['data'] as List;
      var data = json
          .map<CourseModel>((courseJson) => CourseModel.fromJson(courseJson))
          .toList();
      return Right(data);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, DartModel>> fetchAds() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.HOME_ADS);
      return Right(DartModel.fromJson(result.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AllTrack>> fetchAllTracks() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_ALL_TRACKS);
      return Right(AllTrack.fromJson(result.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

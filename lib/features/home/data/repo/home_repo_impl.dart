import 'package:fpdart/src/either.dart';
import 'package:lms/features/home/data/model/ads_model.dart';
import 'package:lms/features/home/data/model/all_tracks_model.dart';
import 'package:lms/features/home/data/model/course_model.dart';
import 'package:lms/features/home/data/repo/home_repo.dart';

import '../../../../core/network/network.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either<Failure?, CoursesModel>> fetchCourses() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.HOME_COURSES);
      return Right(CoursesModel.fromJson(result.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AdsModel>> fetchAds() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.HOME_ADS);
      return Right(AdsModel.fromJson(result.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure?, AllTracksModel>> fetchAllTracks() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.GET_ALL_TRACKS);
      return Right(AllTracksModel.fromJson(result.data));
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

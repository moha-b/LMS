import 'package:fpdart/src/either.dart';
import 'package:lms/features/home/data/model/data.dart';
import 'package:lms/features/home/data/repo/home_repo.dart';

import '../../../../core/network/network.dart';

class HomeRepoImpl extends HomeRepository {
  @override
  Future<Either<String, Data>> fetchCourses() async {
    try {
      var result =
          await NetworkHelper.instance.get(endPoint: EndPoints.HOME_COURSES);
      return Right(Data.fromJson(result.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}

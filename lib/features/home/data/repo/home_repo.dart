import 'package:fpdart/fpdart.dart';

import '../model/data.dart';

abstract class HomeRepository {
  Future<Either<String, Data>> fetchCourses();
}

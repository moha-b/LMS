import 'package:fpdart/fpdart.dart';

import '../model/course_model.dart';

abstract class HomeRepository {
  Future<Either<String, CoursesModel>> fetchCourses();
}

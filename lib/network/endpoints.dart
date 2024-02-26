part of 'network.dart';

String BASE_URL = "";

class EndPoints {
  static const HOMECOURSES = "/homeCourses";
  static const TOPRATEDCOURSES = "/top-ratted-courses";
  static const GETAPPTRACKS = "/homePackages";
  static const LOGIN = "/auth/login";

  static String courseDetails(courseId) =>
      "/courseDetails?my_learning=1&course_id=$courseId";
  static String lessonDetails(lessonId) =>
      "/courseDetails?my_learning=1&course_id=$lessonId";
  static String relatedCourses(courseId) =>
      "relatedCourses?course_id=$courseId";
  static String courseResources(courseId) =>
      "courseResources?course_id=$courseId";
}

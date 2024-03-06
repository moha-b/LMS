part of 'network.dart';

String BASE_URL = "https://coursafer.innoeg.com/api";

class EndPoints {
  static const HOME_COURSES = "/homeCourses";
  static const TOP_RATED_COURSES = "/top-ratted-courses";
  static const GET_ALL_TRACKS = "/homePackages";
  static const HOME_ADS = "/homeAds";
  static const GET_APP_TRACKS = "/homePackages";
  static const LOGIN = "/auth/login";

  static String courseDetails(courseId) =>
      "/courseDetails?my_learning=1&course_id=$courseId";
  static String lessonDetails = "/courseDetails";
  static String relatedCourses = "/relatedCourses";
  static String courseResources(courseId) =>
      "/courseResources?course_id=$courseId";
}

part of 'network.dart';

String BASE_URL = "https://coursafer.innoeg.com/api";

class EndPoints {
  static const HOME_COURSES = "/homeCourses";
  static const TOP_RATED_COURSES = "/top-ratted-courses";
  static const GET_ALL_TRACKS = "/homePackages";
  static const HOME_ADS = "/homeAds";
  static const GET_APP_TRACKS = "/homePackages";
  static const QUIZ = "/examDetails";
  static const QUESTIONS = "/examQuestions";
  static const LOGIN = "/auth/login";
  static const QUIZREPORT = "/examReport";
  static const SUBMITEXAM = "/submitExam";
  static const GET_COURSES_BY_PACKAGE_ID = "/getCoursesByPackageId";

  static String courseDetails(courseId) =>
      "/courseDetails?my_learning=1&course_id=$courseId";
  static String lessonDetails = "/lessonDetails";
  static String TYPES = "/types";
  static String relatedCourses = "/relatedCourses";

  static String courseResources(courseId) =>
      "/courseResources?course_id=$courseId";
}

part of 'navigation.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateToReplacement(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.HOME:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case AppRoute.COURSES:
        return MaterialPageRoute(builder: (_) => const CoursesView());
      case AppRoute.COURSE_DETAILS:
        return MaterialPageRoute(
            builder: (_) =>
                CourseDetailsView(id: 6)); //settings.arguments as int
      case AppRoute.VIEW_ALL_COURSES:
        return MaterialPageRoute(
            builder: (_) =>
                ViewAllCoursesView(data: settings.arguments as DataModel));
      // Quiz
      case AppRoute.QUIZ_INFO:
        return MaterialPageRoute(builder: (_) => const QuizInfoView());
      case AppRoute.QUIZ:
        return MaterialPageRoute(builder: (_) => const QuizView());
      case AppRoute.QUIZ_REPORT:
        return MaterialPageRoute(builder: (_) => const QuizReportView());
      case AppRoute.FULL_DESCRIPTION:
        return MaterialPageRoute(
            builder: (_) => FullDescription(
                  description: settings.arguments as String,
                ));
      case AppRoute.LESSON_DETAILS:
        var args = settings.arguments as LessonDetailsArguments;
        return MaterialPageRoute(
            builder: (_) => LessonsDetailsView(
                  id: args.lessonId,
                  chapter: args.chapter,
                ));
      case AppRoute.SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoute.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }
}

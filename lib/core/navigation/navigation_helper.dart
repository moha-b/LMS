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
        var args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => ViewAllCoursesView(
                data: args['data'], id: args['id'], title: args['title']));
      // Quiz
      case AppRoute.QUIZ_INFO:
        // 23 not working anymore
        return MaterialPageRoute(
            builder: (_) => QuizInfoView(id: settings.arguments as int));
      case AppRoute.QUIZ:
        return MaterialPageRoute(
            builder: (_) => QuizView(
                  id: settings.arguments as int,
                ));
      case AppRoute.QUIZ_REPORT:
        return MaterialPageRoute(builder: (_) {
          final arguments = settings.arguments as Map<String, dynamic>;
          return QuizReportView(
            totalQuestions: arguments['questionLength'],
            codeData: arguments['codeData'],
          );
        });
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

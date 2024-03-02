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
            builder: (_) => CourseDetailsView(id: settings.arguments as num));
      case AppRoute.VIEW_ALL_COURSES:
        return MaterialPageRoute(builder: (_) => const ViewAllCoursesView());
      case AppRoute.SPLASH:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoute.LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }
}

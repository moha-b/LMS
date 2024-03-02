import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/caching/shared_helper.dart';
import 'package:lms/core/helpers/navigation_helper.dart';
import 'package:lms/core/theme/theme.dart';
import 'package:lms/core/utils/app_routes.dart';

import 'features/Login/cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedHelper();
  await SharedHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationHelper.navigatorKey,
            onGenerateRoute: NavigationHelper.generateRoute,
            initialRoute: AppRoute.SPLASH,
            theme: AppTheme.light,
            home: child,
          );
        },
      ),
    );
  }
}

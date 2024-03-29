import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/core/caching/caching_key.dart';
import 'package:lms/core/caching/shared_helper.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';

import '../../core/utils/app_images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      SharedHelper.instance!.readBoolean(CachingKey.IS_LOGIN)
          ? NavigationHelper.navigateToReplacement(AppRoute.HOME)
          : NavigationHelper.navigateToReplacement(AppRoute.LOGIN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray300,
      // Use Color constructor for color values
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Stack(children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(AppImages.splashShape,
                  fit: BoxFit.fitWidth)),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.logo),
                      SizedBox(height: 20.h),
                      Text('Engineering\n     Tracks',
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 30.h,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Text(
                'Engineering Tracks 2024',
                style: TextStyle(
                  color: AppColors.black,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

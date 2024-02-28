import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_images.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Dummy()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      // Use Color constructor for color values
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Stack(children: [
          SvgPicture.asset(AppImages.splashShape),
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

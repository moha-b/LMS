import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w, bottom: 48.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Text(
              "Power BI advanced data analysis from scratch to professionals  ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.gray900),
            ),
          ),
          Text(
            "Semply dummy text of the printing and typesetting industry.Semply dummy text of the printing and typesetting industry",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.gray600),
          ),
        ],
      ),
    );
  }
}

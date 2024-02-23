import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  IconData icon;
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38.w,
          height: 38.h,
          decoration: BoxDecoration(
              color: AppColors.violet50,
              borderRadius: BorderRadius.circular(12)),
          child: Icon(
            icon,
            size: 20.sp,
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 8.w),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.gray400,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.gray800,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

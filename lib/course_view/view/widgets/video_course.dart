import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';
import 'package:lms/utils/app_images.dart';

class VideoCourse extends StatelessWidget {
  const VideoCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0.h),
      child: Stack(
        children: [
          Container(
            width: 327.w,
            height: 171.h,
            foregroundDecoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(AppImages.courseVideo),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: IconButton(
              onPressed: () {
                print('Play');
              },
              icon: Icon(
                AppIcons.play_circle,
                size: 42.71.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

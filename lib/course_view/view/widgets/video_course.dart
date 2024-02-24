import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';
import 'package:lms/utils/app_images.dart';

class VideoCourse extends StatefulWidget {
  const VideoCourse({Key? key}) : super(key: key);

  @override
  _VideoCourseState createState() => _VideoCourseState();
}

class _VideoCourseState extends State<VideoCourse> {
  bool isPlaying = false;
  bool showIcon = true;
  Color color = AppColors.black.withOpacity(0.6);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showIcon = true;
        });
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0.h),
        child: Stack(
          children: [
            Container(
              width: 327.w,
              height: 171.h,
              foregroundDecoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.r),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                  image: AssetImage(AppImages.banner),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            if (showIcon)
              Positioned.fill(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) _startTimer();
                      isPlaying
                          ? color = Colors.transparent
                          : color = AppColors.black.withOpacity(0.6);
                    });
                  },
                  icon: Icon(
                    isPlaying ? AppIcons.pause_circle : AppIcons.play_circle,
                    size: 42.71.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showIcon = false;
      });
    });
  }
}

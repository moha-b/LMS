import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

class LessonsDetails extends StatelessWidget {
  LessonsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      child: SizedBox(
        width: 359.w,
        height: 388.h,
        child: ListView.separated(
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray700,
                  fontWeight: FontWeight.w700,
                  height: 1.5.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: Icon(
                  // AppIcons.tick_circle5,
                  Icons.check_circle_rounded,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 327.w,
                  height: 72.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sales dashboard: Introduction to income statement',
                        style: TextStyle(
                          color: AppColors.gray700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(
                            AppIcons.play_circle,
                            size: 14.sp,
                            color: AppColors.gray600,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              'Video - 02:00',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                AppIcons.more,
                color: AppColors.gray300,
                size: 20.sp,
              )
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemCount: 10,
        ),
      ),
    );
  }
}

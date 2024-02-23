import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';

class LecturesDetails extends StatelessWidget {
  const LecturesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        width: 237.w,
        height: 112.h,
        child: ListView.separated(
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h, right: 16.w),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60.h,
                      width: 234.w,
                      child: Column(
                        children: [
                          Text(
                            'Sales dashboard: Introduction to income statement ',
                            style: TextStyle(
                              color: AppColors.gray900,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                AppIcons.play_circle,
                                size: 15.sp,
                                color: AppColors.gray500,
                              ),
                              SizedBox(width: 4.w),
                              Row(
                                children: [
                                  Text(
                                    'Video - 30:24 - ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                      color: AppColors.gray500,
                                    ),
                                  ),
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp,
                                      color: AppColors.success900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: 2,
        ),
      ),
    );
  }
}

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
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  height: 1.5.h,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: SizedBox(
                  width: 234.w,
                  height: 60.h,
                  child: Column(
                    children: [
                      Text(
                        'Sales dashboard: Introduction to income statement ',
                        style: TextStyle(
                          height: 1.5.h,
                          color: AppColors.gray900,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Icon(
                            AppIcons.play_circle,
                            size: 15.sp,
                            color: AppColors.gray400,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 11.sp,
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'Video - 30:24 - ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Free',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.success900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

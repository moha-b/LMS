import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';
import 'package:lms/utils/app_images.dart';

class CoursesYouMightLike extends StatelessWidget {
  const CoursesYouMightLike({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 0, 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Courses you might like',
            style: TextStyle(
              color: AppColors.gray900,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 231.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 207.w,
                                height: 122.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      AppImages.dummyImage1,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 12.h,
                                left: 12.w,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.white,
                                  child: Icon(
                                    size: 20.sp,
                                    AppIcons.heart,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 193.w,
                                height: 40.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Power BI advanced data analysis',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.gray900,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 23.h,
                                        top: 5.h,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            AppIcons.star1,
                                            size: 12.sp,
                                            color: AppColors.orange300,
                                            fill: 1,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            '5.5',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: const AssetImage(
                                        AppImages.instructor,
                                      ),
                                      radius: 10.sp,
                                    ),
                                    SizedBox(width: 4.sp),
                                    Text(
                                      'Heba Abd Elsahafi',
                                      style: TextStyle(
                                        color: AppColors.gray600,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                r'$2500',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 12.w,
                    ),
                itemCount: 3),
          ),
        ],
      ),
    );
  }
}

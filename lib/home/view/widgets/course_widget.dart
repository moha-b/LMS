import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 207.w,
      height: 227.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseImageWidget(),
          SizedBox(height: 8.h),
          const CourseNameWidget(),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundImage: AssetImage(AppImages.instructor),
                ),
                SizedBox(width: 4.w),
                Text(
                  "Heba, Ahmed, Moha..",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h ,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Row(
              children: [
                Text('\$2500',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 4.w),
                Text('\$5000',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: AppColors.black,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CourseNameWidget extends StatelessWidget {
  const CourseNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "Power BI advanced data analysis",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.blue900,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(
                  AppIcons.star1,
                  color: AppColors.orange600,
                ),
                SizedBox(width: 3.w),
                Text(
                  "5.5",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseImageWidget extends StatelessWidget {
  const CourseImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 122.h,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image: AssetImage(AppImages.dummyImage1),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
            ),
            icon: Icon(
              size: 20.sp,
              AppIcons.heart,
              color: AppColors.secondary,
            ),
          ),
          Container(
            width: 62.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Center(
              child: Text('Soft Skills',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
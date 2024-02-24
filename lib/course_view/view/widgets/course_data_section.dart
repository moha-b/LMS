import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/course_view/data/models/course/course_status_model.dart';
import 'package:lms/course_view/view/widgets/course_details.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';
import 'package:lms/utils/app_images.dart';

class CourseDataSection extends StatelessWidget {
  const CourseDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Self Learning • Maintenance Track',
            style: TextStyle(
              color: AppColors.gray400,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Power BI advanced Data Analysis',
                  style: TextStyle(
                    color: AppColors.gray900,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => print('Export'),
                child: Icon(
                  AppIcons.export_1,
                  size: 24.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
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
          SizedBox(height: 16.h),
          SizedBox(
            width: 411.w,
            height: 38.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CourseDetails(model: courses[index]),
                separatorBuilder: (context, index) => SizedBox(width: 16.sp),
                itemCount: 4),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Text(
                r'$198',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 8.sp),
              Text.rich(
                TextSpan(
                  text: 'Disc. ',
                  style: TextStyle(
                    color: AppColors.gray500,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  children: const [
                    TextSpan(
                      text: r'$500',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.error50,
                radius: 24.r,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.heart5,
                    color: AppColors.secondary,
                    size: 25.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            height: 1.h,
            width: 327.w,
            color: AppColors.gray200,
          ),
        ],
      ),
    );
  }
}

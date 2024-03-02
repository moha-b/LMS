import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

import '../../../core/common/course_view/view/widgets/widgets.dart';

class Resourses extends StatefulWidget {
  const Resourses({super.key});

  @override
  State<Resourses> createState() => _ResoursesState();
}

class _ResoursesState extends State<Resourses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 24.h,bottom:16.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.violet50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  AppIcons.folder,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'File name.Docx',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray900,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'File Size : 4MB',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                AppIcons.document_download,
                color: AppColors.primary,
                size: 17.sp,
              ),
            ],
          ),
          LineSeparated(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.violet50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  AppIcons.link,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  'https://www.google.com.eg/?hl=ar',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray900,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Spacer(),
              Icon(
                AppIcons.direct_right,
                color: AppColors.primary,
                size: 17.sp,
              ),
            ],
          ),
          LineSeparated(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.violet50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  AppIcons.link,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Text(
                  'https://www.google.com.eg/?hl=ar',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray900,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Spacer(),
              Icon(
                AppIcons.direct_right,
                color: AppColors.primary,
                size: 17.sp,
              ),
            ],
          ),
          LineSeparated(),
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.violet50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(
                  AppIcons.folder,
                  color: AppColors.primary,
                  size: 16.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'File name.Docx',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray900,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'File Size : 4MB',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                AppIcons.document_download,
                color: AppColors.primary,
                size: 17.sp,
              ),
            ],
          ),


        ],
      ),
    );
  }
}

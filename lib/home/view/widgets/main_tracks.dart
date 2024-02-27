import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_colors.dart';

class MainTracks extends StatefulWidget {
  const MainTracks({Key? key}) : super(key: key);

  @override
  State<MainTracks> createState() => _MainTracksState();
}

class _MainTracksState extends State<MainTracks> {
  List items = [
    'Soft Skills',
    'Maintenance Track',
    'Physical Courses',
    'Oil & Gas Training',
    'Civil Self Learning',
    'Management Training '
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 16.h,top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Main Tracks",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.gray900,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "view all",
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 38.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 38.h,
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppColors.gray200,
                  ),
                  child: Text(
                    items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp,color: AppColors.gray800),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8.w)),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 38.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 38.h,
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppColors.gray200,
                  ),
                  child: Text(
                    items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp,color: AppColors.gray800),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8.w)),
        ),
      ],
    );
  }
}

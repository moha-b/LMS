import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../utils/app_colors.dart';
import 'courseWidget.dart';


class CourseList extends StatelessWidget {
  const CourseList({super.key, required this.sectionTitle, required this.onViewAllClicked});
  final String sectionTitle;
  final Function() onViewAllClicked;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 288.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                bottom: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sectionTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.blue900,
                    ),
                  ),
                  TextButton(
                    onPressed: onViewAllClicked,
                    child: Text(
                      'View all',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemBuilder: (context, index) => CourseWidget(),
                  separatorBuilder: (context, index) => SizedBox(width: 12.w),
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}



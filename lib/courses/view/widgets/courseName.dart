import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

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

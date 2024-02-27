import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class TrackTitleWidget extends StatelessWidget {
  const TrackTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w,top: 27.h,bottom: 18.h),
      child: Text(
        'Dummy',
        style: TextStyle(color: AppColors.blue800,fontSize: 16.sp),
      ),
    );
  }
}
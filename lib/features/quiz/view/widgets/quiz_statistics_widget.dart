import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';

class QuizStatistics extends StatelessWidget {
  const QuizStatistics({
    super.key,
    required this.icon,
    required this.total,
    required this.description,
    this.onTap,
  });
  final IconData icon;
  final String total;
  final String description;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1, color: AppColors.gray200),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColors.violet50,
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(6),
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(width: 1, color: AppColors.gray200),
                    ),
                  ),
                  child: Icon(
                    AppIcons.arrow_right_3,
                    size: 15.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            total,
            style: TextStyle(
              color: AppColors.gray900,
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: AppColors.gray400,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

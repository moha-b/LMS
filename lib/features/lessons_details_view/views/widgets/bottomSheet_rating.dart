import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/primary_button.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

class BottomSheetRating extends StatelessWidget {
  const BottomSheetRating({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SizedBox(
        height: 396.h,
        width: 375.w,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 48.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Rate the course',
                      style: TextStyle(
                        color: AppColors.gray900,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        NavigationHelper.goBack();
                      },
                      child: Icon(
                        AppIcons.close_circle,
                        size: 24.sp,
                        color: AppColors.gray300,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: RatingBar.builder(
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: AppColors.gray300,
                    itemPadding: EdgeInsets.symmetric(horizontal: 5.h),
                    itemBuilder: (context, _) => const Icon(
                      AppIcons.star1,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: SizedBox(
                    width: 327.w,
                    height: 124.h,
                    child: TextFormField(
                      maxLines: 5,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Write your Opinion',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: AppColors.gray300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: AppColors.gray300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              const BorderSide(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  onTap: () {
                    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    NavigationHelper.goBack();
                  },
                  text: 'Send',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  width: 327.w,
                  height: 56.h,
                  haveIcon: true,
                  textColor: AppColors.white,
                  icon: AppIcons.send_25,
                  iconSize: 24.sp,
                  sizeBetweenIconAndText: 16.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

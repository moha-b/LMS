import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/data/models/course/course_status_model.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/lessons_details_view/views/widgets/bottomSheet_rating.dart';
import 'package:lms/features/resoursesAndInfo/widgets/bottomSheet.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseStatusModel> moreTabList = [
      CourseStatusModel(icon: AppIcons.more, title: 'Course details'),
      CourseStatusModel(icon: AppIcons.paperclip_2, title: 'Resources'),
      CourseStatusModel(icon: AppIcons.star, title: 'Rate this course'),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: SizedBox(
        width: 327.w,
        height: 120.h,
        child: ListView.separated(
            itemBuilder: (context, index) => Row(
                  children: [
                    Icon(
                      moreTabList[index].icon,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      moreTabList[index].title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray900,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(24.r),
                                    topLeft: Radius.circular(24.r)),
                              ),
                              builder: (context) => const CourseDetailsSheet());
                        } else if (index == 1) {
                          NavigationHelper.navigateTo(AppRoute.RESOURCES);
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return const BottomSheetRating();
                            },
                          );
                        }
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: AppColors.gray400,
                      ),
                    ),
                  ],
                ),
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
            itemCount: 3),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_images.dart';
import 'package:lms/features/courses/view/widgets/widgets.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/utils/app_icons.dart';

class ViewAllCoursesView extends StatelessWidget {
  const ViewAllCoursesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Self Learning"),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: LineSeparated()),
          const SliverToBoxAdapter(child: Categories()),
          const SliverToBoxAdapter(child: TrackTitleWidget()),
          SliverFillRemaining(
            child: ListView.separated(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 12.h),
              itemBuilder: (context, index) => SizedBox(
                width: 328.w,
                height: 200.h,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 95.h,
                      width: 328.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.dummyImage2),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
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
                              width: 44.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    AppIcons.star1,
                                    size: 12.sp,
                                    color: AppColors.orange300,
                                    fill: 1,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '5.5',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10.r,
                            backgroundImage:
                                const AssetImage(AppImages.instructor),
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
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text(
                            '\$2500',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '\$5000',
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
              ),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

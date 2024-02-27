import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/courses/view/widgets/categories_widget.dart';
import 'package:lms/courses/view/widgets/track_title_widget.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_images.dart';
import '../../utils/app_icons.dart';
import 'widgets/custom_app_bar.dart';

class ViewAllCourses extends StatelessWidget {
  const ViewAllCourses({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Categories()),
          const SliverToBoxAdapter(child: TrackTitleWidget()),
          SliverFillRemaining(
            child: ListView.separated(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 12.h),
              itemBuilder: (context, index) => Container(
                width: 328.w,
                height: 205.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 95.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.dummyImage1),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){},
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
                            width: 62.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Center(
                              child: Text('Soft Skills',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical:8.h),
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w,),
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
                            backgroundImage: AssetImage(AppImages.instructor),
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
                      height: 8.h ,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        children: [
                          Text('\$2500',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text('\$5000',
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

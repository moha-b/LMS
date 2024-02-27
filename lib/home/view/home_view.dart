import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/home/view/widgets/bottom_nav_bar.dart';
import 'package:lms/home/view/widgets/course_list.dart';
import 'package:lms/home/view/widgets/main_courses.dart';
import 'package:lms/home/view/widgets/main_tracks.dart';
import 'package:lms/home/view/widgets/slider_home_widgets.dart';
import 'package:lms/home/view/widgets/top_picks.dart';
import 'package:lms/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: RichText(
                    text: TextSpan(
                        text: "Morning, ",
                        style: TextStyle(
                            color: AppColors.gray900, fontSize: 24.sp),
                        children: [
                          TextSpan(
                              text: "Ahmed 🌞",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ))
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "What do you want to learn today?",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.gray600),
                  ),
                ),
                const HomeAds(),
                SizedBox(height: 15.h),
                CourseList(
                  sectionTitle: "Popular Courses",
                  onViewAllClicked: () {},
                ),
                const MainTracks(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarSection(),
    );
  }
}

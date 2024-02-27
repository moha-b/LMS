import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/course_view/view/widgets/course_data_section.dart';
import 'package:lms/course_view/view/widgets/courses_you_might_like.dart';
import 'package:lms/course_view/view/widgets/title_and_lectures.dart';
import 'package:lms/course_view/view/widgets/video_course.dart';
import 'package:lms/utils/app_colors.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Details',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.gray900,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const VideoCourse(),
                const CourseDataSection(),
                const TitleAndLectures(),
                const CoursesYouMightLike(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

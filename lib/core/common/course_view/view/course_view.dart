import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';

import '../../../utils/app_colors.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
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

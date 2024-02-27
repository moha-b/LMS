import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/courses/view/widgets/corsesList.dart';
import 'package:lms/courses/view/widgets/custom_app_bar.dart';
import 'package:lms/courses/view/widgets/searchField.dart';
import 'package:lms/courses/view/view_all_courses.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: CustomScrollView(
        slivers: [
          const SearchField(),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.grey[200],
            ),
          ),
          CourseList(
            sectionTitle: 'Self Learning',
            onViewAllClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ViewAllCourses(title: 'Self Learning'),
                )),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          CourseList(
            sectionTitle: 'Interactive online courses',
            onViewAllClicked: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const ViewAllCourses(title: 'Interactive online courses'),
              )),
          ),
        ],
      ),
    );
  }
}

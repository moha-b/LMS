import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';
import 'package:lms/features/courses/view/view_all_courses.dart';
import 'package:lms/features/courses/view/widgets/widgets.dart';

import '../../../core/navigation/navigation.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Courses'),
      body: CustomScrollView(
        slivers: [
          const SearchField(),
          const SliverToBoxAdapter(child: LineSeparated()),
          CourseList(
            sectionTitle: 'Self Learning',
            onViewAllClicked: () =>
                NavigationHelper.navigateTo(AppRoute.VIEW_ALL_COURSES),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          CourseList(
            sectionTitle: 'Interactive online courses',
            onViewAllClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewAllCoursesView(),
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';
import 'package:lms/features/courses/bloc/courses_bloc.dart';
import 'package:lms/features/courses/view/widgets/widgets.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/navigation/navigation.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesBloc()..add(FetchCourses()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Courses'),
        body: CustomScrollView(
          slivers: [
            const SearchField(),
            const SliverToBoxAdapter(child: LineSeparated()),
            SliverFillRemaining(
              child: BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is CoursesSuccess) {
                    return ListView.separated(
                        itemBuilder: (context, index) =>
                            state.data[index].courses.isEmpty
                                ? const SizedBox.shrink()
                                : CourseList(
                                    courses: state.data[index].courses,
                                    sectionTitle: state.data[index].title,
                                    onViewAllClicked: () =>
                                        NavigationHelper.navigateTo(
                                      AppRoute.VIEW_ALL_COURSES,
                                      arguments: state.data[index],
                                    ),
                                  ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemCount: 3);
                  } else if (state is CoursesInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                      child: Text("I Love InovvaDigets"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

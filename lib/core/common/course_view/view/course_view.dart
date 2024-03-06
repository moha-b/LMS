import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/cubit/course_view_cubit.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';

import '../../../../features/home/bloc/home_bloc.dart';
import '../../../utils/app_colors.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key, required this.id});
  final int id;
  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return BlocProvider(
      create: (context) => CourseViewCubit()
        ..fetchCoursesDetails(widget.id)
        ..fetchRelatedCoursesDetails(widget.id),
      child: Scaffold(
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
        body: BlocBuilder<CourseViewCubit, CourseViewState>(
          builder: (context, state) {
            if (state.courseState == RequestState.loaded) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        VideoCourse(image: state.courseData!.image),
                        CourseDataSection(
                          data: state.courseData!,
                        ),
                        TitleAndLectures(
                          data: state.courseData!,
                        ),
                        CoursesYouMightLike(
                          id: state.courseData!.id,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state.courseState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Error loading data'),
              );
            }
          },
        ),
      ),
    );
  }
}

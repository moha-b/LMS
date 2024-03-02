import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';
import 'package:lms/features/course_view/cubit/course_view_cubit.dart';

import '../../../utils/app_colors.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({super.key, required this.id});
  final num id;
  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseViewCubit()..fetchCoursesDetails(widget.id),
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
            if (state is CourseViewSuccessState) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const VideoCourse(),
                        CourseDataSection(
                          data: state.data,
                        ),
                        TitleAndLectures(
                          data: state.data,
                        ),
                        CoursesYouMightLike(
                          id: widget.id,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is CourseViewLoadingState) {
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

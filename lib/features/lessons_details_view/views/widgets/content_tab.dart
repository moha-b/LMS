import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/cubit/lectures_expansion_cubit.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/lessons_details_view/views/widgets/lectures_details.dart';
import 'package:lms/features/lessons_details_view/views/widgets/line_separated.dart';

import '../../../../core/common/course_view/data/models/course_model.dart';

class ContentTab extends StatelessWidget {
  const ContentTab({Key? key, required this.chapters}) : super(key: key);

  final List<Chapter> chapters;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LecturesExpansionCubit(chapters.length),
      child: BlocBuilder<LecturesExpansionCubit, LecturesExpansionState>(
        builder: (context, state) {
          final lecturesExpansionCubit = context.read<LecturesExpansionCubit>();
          return ListView.separated(
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chapter ${index + 1} - ${chapters.length} Lectures - ${chapters[index].lessons.fold(0, (total, lesson) => total + lesson.totalMinutes)} Minutes',
                        style: TextStyle(
                          color: AppColors.gray900,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 28.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: AppColors.violet50,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            lecturesExpansionCubit
                                .toggleExpandedLecturesDetails(index);
                          },
                          child: lecturesExpansionCubit.isExpandedList[index]
                              ? Icon(
                                  AppIcons.arrow_up_2,
                                  size: 18.sp,
                                  color: AppColors.primary,
                                )
                              : Icon(
                                  AppIcons.arrow_down_1,
                                  size: 18.sp,
                                  color: AppColors.primary,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (lecturesExpansionCubit.isExpandedList[index])
                  LessonsDetails(
                    lessons: chapters[index].lessons,
                    chapters: chapters,
                  ),
              ],
            ),
            separatorBuilder: (context, index) => const LineSeparated(),
            itemCount: chapters.length,
          );
        },
      ),
    );
  }
}

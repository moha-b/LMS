import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/lessons_details_view/cubit/lessons_cubit.dart';
import 'package:lms/features/lessons_details_view/views/widgets/video_player.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({Key? key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit()..fetchLessons(id),
      child: BlocBuilder<LessonsCubit, LessonsState>(
        builder: (context, state) {
          if (state is LessonsSuccess) {
            log(state.lesson.videoUrl.toString(), name: 'URL');
            return AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.violet50,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: state.lesson.videoUrl!.isNotEmpty &&
                        state.lesson.videoUrl != null
                    ? VideoPlayerWidget(videoUrl: state.lesson.videoUrl!)
                    : Center(
                        child: Text(
                        'Video Not Found',
                        style: TextStyle(
                          color: AppColors.error900,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
              ),
            );
          } else if (state is LessonsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(230.h);
}

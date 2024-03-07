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
            return AppBar(
              backgroundColor: AppColors.violet50,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: VideoPlayerWidget(videoUrl: state.lesson.videoUrl),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/lessons_details_view/views/widgets/video_player.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.violet50,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: VideoPlayerWidget(videoUrl: 'assets/videos/1.mp4'),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(230.h);
}

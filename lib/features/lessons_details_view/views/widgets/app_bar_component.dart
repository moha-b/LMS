import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/lessons_details_view/views/widgets/video_player.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.violet50,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 266.h,
              child: const VideoPlayerWidget(
                  videoUrl:
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 0),
              child: SizedBox(
                width: 327.w,
                height: 40.h,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => NavigationHelper.goBack(),
                      child: Container(
                        width: 28.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: AppColors.violet50,
                          borderRadius: BorderRadius.circular(35.r),
                        ),
                        child: Icon(
                          AppIcons.arrow_left,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => print('More'),
                      icon: Icon(
                        AppIcons.more_circle,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(230.h);
}

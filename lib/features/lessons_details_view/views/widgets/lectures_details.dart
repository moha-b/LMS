import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/data/models/course_model.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/features/lessons_details_view/views/widgets/lesson_details_data.dart';

class LessonsDetails extends StatelessWidget {
  LessonsDetails({Key? key, required this.lessons, required this.chapters})
      : super(key: key);

  final List<Lesson> lessons;
  final List<Chapter> chapters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => NavigationHelper.navigateToReplacement(
            AppRoute.LESSON_DETAILS,
            arguments: LessonDetailsArguments(lessons[index].id, chapters),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray700,
                  fontWeight: FontWeight.w700,
                  height: 1.5.h,
                ),
              ),
              lessons[index].isSeen == 1
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.primary,
                        size: 16.sp,
                      ),
                    )
                  : SizedBox(width: 15.w),
              Expanded(
                child: SizedBox(
                  width: 327.w,
                  height: 72.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lessons[index].title,
                        style: TextStyle(
                          color: AppColors.gray700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          LessonDetailsData(
                            onTap: () => NavigationHelper.navigateToReplacement(
                              AppRoute.LESSON_DETAILS,
                              arguments: LessonDetailsArguments(
                                lessons[index].id,
                                chapters,
                              ),
                            ),
                            text:
                                'Video - ${lessons[index].totalMinutes} Minutes',
                            icon: AppIcons.play_circle,
                          ),
                          if (lessons[index].isQuiz == 1)
                            LessonDetailsData(
                              onTap: () {
                                NavigationHelper.navigateTo(
                                  AppRoute.QUIZ_INFO,
                                  arguments: 24,
                                );
                              },
                              text: 'Quiz',
                              icon: AppIcons.task,
                            ),
                          if (lessons[index].attachments.isNotEmpty)
                            LessonDetailsData(
                              onTap: () {
                                try {
                                  NetworkHelper.instance.downloadFile(
                                      fileUrl:
                                          lessons[index].attachments[0].url,
                                      savePath:
                                          '/storage/emulated/0/Download/${lessons[index].attachments[0].title}.pdf');
                                  IconSnackBar.show(
                                    context: context,
                                    snackBarType: SnackBarType.save,
                                    label: 'Downloaded successfully',
                                  );
                                } catch (e) {
                                  IconSnackBar.show(
                                    context: context,
                                    snackBarType: SnackBarType.fail,
                                    label: 'Downloaded successfully',
                                  );
                                }
                              },
                              text: 'Pdf',
                              icon: AppIcons.document_text,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                AppIcons.more,
                color: AppColors.gray300,
                size: 20.sp,
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemCount: lessons.length,
      ),
    );
  }
}

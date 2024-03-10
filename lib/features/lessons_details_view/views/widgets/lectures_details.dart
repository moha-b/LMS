import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/data/models/course_model.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

class LessonsDetails extends StatelessWidget {
  LessonsDetails({super.key, required this.lessons, required this.chapters});

  final List<Lesson> lessons;
  final List<Chapter> chapters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
      child: SizedBox(
        width: 359.w,
        height: 388.h,
        child: ListView.separated(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
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
                        GestureDetector(
                          onTap: () {
                            if (lessons[index].isQuiz == 1) {
                              NavigationHelper.navigateTo(AppRoute.QUIZ_INFO,
                                  arguments: lessons[index].quizId);
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                lessons[index].isQuiz == 1
                                    ? AppIcons.task
                                    : AppIcons.play_circle,
                                size: 14.sp,
                                color: AppColors.gray600,
                              ),
                              SizedBox(width: 4.w),
                              Row(
                                children: [
                                  Text(
                                    lessons[index].isQuiz == 1
                                        ? 'Quiz'
                                        : 'Video - ${lessons[index].totalMinutes} Minutes',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray600,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  lessons[index].attachments.isEmpty
                                      ? const SizedBox.shrink()
                                      : GestureDetector(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Icon(
                                                AppIcons.document_text,
                                                size: 14.sp,
                                                color: AppColors.gray600,
                                              ),
                                              SizedBox(width: 5.w),
                                              Text(
                                                'Pdf',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.gray600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
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
          separatorBuilder: (context, index) => SizedBox(height: 20.h),
          itemCount: lessons.length,
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class LecturesDetails extends StatelessWidget {
  LecturesDetails({super.key, required this.lesson, required this.chapter});

  final List<Lesson> lesson;
  final List<Chapter> chapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        width: 237.w,
        height: 112.h,
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => NavigationHelper.navigateToReplacement(
              AppRoute.LESSON_DETAILS,
              arguments: LessonDetailsArguments(lesson[index].id, chapter),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    height: 1.5.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: SizedBox(
                    width: 234.w,
                    height: 60.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson[index].title,
                          style: TextStyle(
                            height: 1.5.h,
                            color: AppColors.gray900,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        GestureDetector(
                          onTap: () {
                            if (lesson[index].isQuiz == 1) {
                              NavigationHelper.navigateTo(AppRoute.QUIZ_INFO,
                                  arguments: lesson[index].quizId);
                            }
                          },
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    lesson[index].isQuiz == 1
                                        ? AppIcons.task
                                        : AppIcons.play_circle,
                                    size: 14.sp,
                                    color: AppColors.gray400,
                                  ),
                                  SizedBox(width: 4.w),
                                  Row(
                                    children: [
                                      Text(
                                        lesson[index].isQuiz == 1
                                            ? 'Quiz'
                                            : 'Video - ${lesson[index].totalMinutes} Minutes',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.gray400,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      lesson[index].attachments.isEmpty
                                          ? const SizedBox.shrink()
                                          : GestureDetector(
                                              onTap: () {},
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    AppIcons.document_text,
                                                    size: 14.sp,
                                                    color: AppColors.gray400,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    'Pdf',
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.gray400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.success900,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: lesson.length,
        ),
      ),
    );
  }
}

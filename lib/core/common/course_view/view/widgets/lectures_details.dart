part of 'widgets.dart';

class LecturesDetails extends StatelessWidget {
  LecturesDetails({super.key, required this.lesson, required this.chapter});

  final List<Lesson> lesson;
  final List<Chapter> chapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => NavigationHelper.navigateTo(
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
                      Row(
                        children: [
                          LessonDetailsData(
                            onTap: () => NavigationHelper.navigateToReplacement(
                              AppRoute.LESSON_DETAILS,
                              arguments: LessonDetailsArguments(
                                lesson[index].id,
                                chapter,
                              ),
                            ),
                            text:
                                'Video - ${lesson[index].totalMinutes} Minutes',
                            icon: AppIcons.play_circle,
                          ),
                          if (lesson[index].isQuiz == 1)
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
                          if (lesson[index].attachments.isNotEmpty)
                            LessonDetailsData(
                              onTap: () {
                                try {
                                  NetworkHelper.instance.downloadFile(
                                      fileUrl: lesson[index].attachments[0].url,
                                      savePath:
                                          '/storage/emulated/0/Download/${lesson[index].attachments[0].title}.pdf');
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
                          Text(
                            'Free',
                            style: TextStyle(
                              color: AppColors.success900,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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
    );
  }
}

part of 'widgets.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key, required this.model});

  Course model;
  @override
  Widget build(BuildContext context) {
    List<CourseStatusModel> courses = [
      CourseStatusModel(
          title: 'Release Date',
          description: DateFormat('yyyy-MM-dd').format(model.created),
          icon: AppIcons.note_1),
      CourseStatusModel(
          title: 'Students',
          description: model.studentsCount.toString(),
          icon: AppIcons.user),
      CourseStatusModel(
          title: 'Duration',
          description: '${model.duration} h',
          icon: AppIcons.clock),
      CourseStatusModel(
          title: 'Lectures',
          description: calculateTotalLessonsCount().toString(),
          icon: AppIcons.document_text),
    ];
    return SizedBox(
      width: 411.w,
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                  color: AppColors.violet50,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Icon(
                courses[index].icon,
                size: 20.sp,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 8.w),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses[index].title!,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.gray400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${courses[index].description}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.gray800,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: 4,
      ),
    );
  }

  int calculateTotalLessonsCount() {
    int totalLessons = 0;
    for (var chapter in model.chapters) {
      totalLessons += chapter.lessons.length;
    }
    return totalLessons;
  }
}

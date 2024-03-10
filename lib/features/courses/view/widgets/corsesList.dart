part of 'widgets.dart';

class CourseList extends StatelessWidget {
  const CourseList(
      {super.key,
      required this.sectionTitle,
      required this.onViewAllClicked,
      required this.courses});
  final String sectionTitle;
  final List<CourseModel> courses;
  final Function() onViewAllClicked;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 16.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.blue900,
                  ),
                ),
                TextButton(
                  onPressed: onViewAllClicked,
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemBuilder: (context, index) =>
                    CourseWidget(course: courses[index], title: sectionTitle),
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemCount: courses.length),
          ),
        ],
      ),
    );
  }
}

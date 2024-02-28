part of 'widgets.dart';

class CourseDetails extends StatelessWidget {
  CourseDetails({super.key, required this.model});

  CourseStatusModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38.w,
          height: 38.h,
          decoration: BoxDecoration(
              color: AppColors.violet50,
              borderRadius: BorderRadius.circular(12.r)),
          child: Icon(
            model.icon,
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
                model.title,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.gray400,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                model.description,
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
    );
  }
}

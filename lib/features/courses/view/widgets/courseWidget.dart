part of 'widgets.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 207.w,
      height: 227.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseImageWidget(),
          SizedBox(height: 8.h),
          const CourseNameWidget(),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundImage: AssetImage(AppImages.instructor),
                ),
                SizedBox(width: 4.w),
                Text(
                  "Heba, Ahmed, Moha..",
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w),
            child: Row(
              children: [
                Text(
                  '\$2500',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  '\$5000',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    color: AppColors.black,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

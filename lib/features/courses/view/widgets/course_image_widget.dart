part of 'widgets.dart';

class CourseImageWidget extends StatelessWidget {
  const CourseImageWidget({
    super.key,
    required this.image,
    required this.track,
  });
  final String image;
  final String track;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 122.h,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.w, left: 12.h),
            child: GestureDetector(
              child: Container(
                width: 30.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Icon(
                  AppIcons.heart,
                  color: AppColors.secondary,
                  size: 17.sp,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 12.w),
            child: Container(
              width: 62.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: Text(
                  track,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

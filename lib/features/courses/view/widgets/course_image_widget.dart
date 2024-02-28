part of 'widgets.dart';

class CourseImageWidget extends StatelessWidget {
  const CourseImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 122.h,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image: AssetImage(AppImages.dummyImage1),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white,
            ),
            icon: Icon(
              size: 20.sp,
              AppIcons.heart,
              color: AppColors.secondary,
            ),
          ),
          Container(
            width: 62.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Center(
              child: Text(
                'Soft Skills',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

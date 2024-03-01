part of 'widgets.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 207.w,
      height: 227.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CourseImageWidget(),
            Padding(
              padding: EdgeInsets.fromLTRB(7.w, 8.h, 7.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 193.w,
                    height: 40.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Power BI advanced data analysis',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.gray900,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 23.h, top: 5.h),
                          child: Row(
                            children: [
                              Icon(
                                AppIcons.star1,
                                size: 12.sp,
                                color: AppColors.orange300,
                                fill: 1,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '5.5',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                            AppImages.instructor,
                          ),
                          radius: 10.r,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Heba, Ahmed, Moha..',
                          style: TextStyle(
                            color: AppColors.gray600,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        r'$2500',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        r'$2500',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          color: AppColors.black,
                          decoration: TextDecoration.lineThrough,
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
    );
  }
}

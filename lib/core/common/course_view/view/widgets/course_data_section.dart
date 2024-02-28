part of 'widgets.dart';

class CourseDataSection extends StatelessWidget {
  const CourseDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Self Learning • Maintenance Track',
            style: TextStyle(
              color: AppColors.gray400,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Power BI advanced Data Analysis',
                  style: TextStyle(
                    color: AppColors.gray900,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => print('Export'),
                child: Icon(
                  AppIcons.export_1,
                  size: 24.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(
                  AppImages.instructor,
                ),
                radius: 10.r,
              ),
              SizedBox(width: 4.w),
              Text(
                'Heba Abd Elsahafi',
                style: TextStyle(
                  color: AppColors.gray600,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: 411.w,
            height: 38.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CourseDetails(model: courses[index]),
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemCount: 4),
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                r'$198',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Text.rich(
                style: TextStyle(
                  color: AppColors.gray500,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                TextSpan(
                  text: 'Disc. ',
                  children: [
                    TextSpan(
                      text: r'$500',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        height: 1.4.h,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.error50,
                radius: 24.r,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    AppIcons.heart5,
                    color: AppColors.secondary,
                    size: 25.sp,
                  ),
                ),
              ),
            ],
          ),
          const LineSeparated(),
        ],
      ),
    );
  }
}

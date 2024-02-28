part of 'widgets.dart';

class BottomSheetComponent extends StatelessWidget {
  const BottomSheetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 352.h,
      width: double.infinity,
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 48.h),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Course instructor',
                      style: TextStyle(
                        color: AppColors.gray900,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        AppIcons.close_circle,
                        size: 24.sp,
                        color: AppColors.gray300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: SizedBox(
                  width: 327.w,
                  height: 232.h,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                            AppImages.instructor,
                          ),
                          radius: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Heba Abd Elsahafi',
                              style: TextStyle(
                                color: AppColors.gray900,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '10 courses',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Transform.rotate(
                          angle: -1.6,
                          child: Icon(
                            AppIcons.arrow_down_1,
                            size: 24.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 24.h),
                    itemCount: 4,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

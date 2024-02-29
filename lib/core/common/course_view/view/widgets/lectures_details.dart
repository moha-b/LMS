part of 'widgets.dart';

class LecturesDetails extends StatelessWidget {
  LecturesDetails({super.key, required this.data});
  List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: SizedBox(
        width: 237.w,
        height: 112.h,
        child: ListView.separated(
          itemBuilder: (context, index) => Row(
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
                        data[index].title,
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
                          Icon(
                            AppIcons.play_circle,
                            size: 15.sp,
                            color: AppColors.gray400,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontSize: 11.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Video - ${data[index].totalMinutes} - ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Free',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.success900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: data.length,
        ),
      ),
    );
  }
}

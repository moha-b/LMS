part of 'widgets.dart';

class CourseDataSection extends StatelessWidget {
  const CourseDataSection({super.key, required this.data});

  final Course data;

  @override
  Widget build(BuildContext context) {
    List<Instructors> instructors = [
      Instructors(name: 'John Doe', image: AppImages.instructor),
      Instructors(name: 'Jane Smith', image: AppImages.instructor),
      Instructors(name: 'Jane Smith', image: AppImages.instructor),
      Instructors(name: 'Jane Smith', image: AppImages.instructor),
      Instructors(name: 'Jane Smith', image: AppImages.instructor),
      Instructors(name: 'Jane Smith', image: AppImages.instructor),
    ];
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
                  data.title,
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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetComponent(
                    data: data.instructors,
                  );
                },
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < data.instructors.length; i++)
                  Align(
                    widthFactor: 0.6,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundImage: NetworkImage(data.instructors[i].image),
                    ),
                  ),
                SizedBox(width: 8.w),
                Expanded(
                  child: SizedBox(
                    width: 153.w,
                    height: 20.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.instructors.length,
                      itemBuilder: (context, index) {
                        final lastName = data.instructors[index].name
                            .toString()
                            .split(' ')
                            .last;
                        if (!lastName.isNotEmpty) {
                          return Text(
                            data.instructors[index].name,
                            style: TextStyle(
                              color: AppColors.gray600,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        } else {
                          if (index < data.instructors.length - 1) {
                            return Text(
                              '$lastName, ',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          } else {
                            return Text(
                              data.instructors[index].name,
                              style: TextStyle(
                                color: AppColors.gray600,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CourseDetails(model: data),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${data.price}',
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

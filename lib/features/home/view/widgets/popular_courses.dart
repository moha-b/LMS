part of 'widgets.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key, required this.list});
  final List<CourseModel> list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.w, 24.h, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Courses',
                  style: TextStyle(
                    color: AppColors.gray900,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () async =>
                      await NavigationHelper.navigateTo(AppRoute.COURSES),
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 231.h,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                      children: [
                        InkWell(
                          onTap: () => NavigationHelper.navigateTo(
                              AppRoute.COURSE_DETAILS,
                              arguments: list[index].id),
                          child: Container(
                            width: 207.w,
                            height: 120.h,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 12.h, left: 12.w),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: NetworkImage(list[index].image!),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: IconButton(
                                onPressed: () => print("like"),
                                icon: Icon(
                                  size: 20.sp,
                                  AppIcons.heart,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 193.w,
                              height: 40.h,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      list[index].title!,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.gray900,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 23.h,
                                      top: 5.h,
                                    ),
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
                                          list[index].rate.toString(),
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
                                  if (list[index].instructors!.isNotEmpty)
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        list[index].instructors![0].image!,
                                      ),
                                      radius: 10.r,
                                    ),
                                  SizedBox(width: 4.w),
                                  if (list[index].instructors!.isNotEmpty)
                                    Text(
                                      list[index].instructors![0].name!,
                                      style: TextStyle(
                                        color: AppColors.gray600,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              '\$${list[index].price}',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemCount: list.length),
          ),
        ],
      ),
    );
  }
}

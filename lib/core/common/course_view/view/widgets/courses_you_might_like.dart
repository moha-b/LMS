part of 'widgets.dart';

class CoursesYouMightLike extends StatelessWidget {
  const CoursesYouMightLike({super.key, required this.id});

  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseViewCubit, CourseViewState>(
      builder: (context, state) {
        if (state.relatedCoursesState == RequestState.loaded) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0.w, 24.h, 0, 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    'Courses you might like',
                    style: TextStyle(
                      color: AppColors.gray900,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 231.h,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => NavigationHelper.navigateTo(
                                AppRoute.COURSE_DETAILS,
                                arguments: state.relatedCoursesData![index].id),
                            child: Column(
                              children: [
                                Container(
                                  width: 207.w,
                                  height: 122.h,
                                  alignment: Alignment.topLeft,
                                  padding:
                                      EdgeInsets.only(top: 12.h, left: 12.w),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(12.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.relatedCoursesData![index].image!,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 20.sp,
                                        AppIcons.heart,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                  ),
                                ),
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
                                              state.relatedCoursesData![index]
                                                  .title!,
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
                                                  state
                                                      .relatedCoursesData![
                                                          index]
                                                      .rate!
                                                      .toString(),
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
                                    state.relatedCoursesData![index]
                                                .instructors !=
                                            []
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    state
                                                        .relatedCoursesData![
                                                            index]
                                                        .instructors![0]
                                                        .image!,
                                                  ),
                                                  radius: 10.r,
                                                ),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  state
                                                      .relatedCoursesData![
                                                          index]
                                                      .instructors![0]
                                                      .name!,
                                                  style: TextStyle(
                                                    color: AppColors.gray600,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    Text(
                                      '\$${state.relatedCoursesData![index].price}',
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
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 12.w,
                          ),
                      itemCount: state.relatedCoursesData!.length),
                ),
              ],
            ),
          );
        } else if (state.relatedCoursesState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('Error loading data'),
          );
        }
      },
    );
  }
}

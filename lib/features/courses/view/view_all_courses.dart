import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/view/widgets/widgets.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/courses/bloc/tracks_bloc.dart';
import 'package:lms/features/courses/view/widgets/widgets.dart';

import '../../../core/common/custom_app_bar.dart';
import '../../../core/utils/app_icons.dart';
import '../data/model.dart';

class ViewAllCoursesView extends StatelessWidget {
  const ViewAllCoursesView({super.key, required this.data});
  final DataModel data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TracksBloc()..add(SelectedTrack(data.tracks[0].id)),
      child: Scaffold(
        appBar: CustomAppBar(title: data.title),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: LineSeparated()),
            SliverToBoxAdapter(child: Categories(tracks: data.tracks)),
            SliverToBoxAdapter(
              child: BlocBuilder<TracksBloc, TracksState>(
                builder: (context, state) {
                  if (state is TracksSuccess) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 24.w, top: 27.h, bottom: 18.h),
                      child: Text(
                        state.track.title,
                        style: TextStyle(
                          color: AppColors.gray900,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
            SliverFillRemaining(
              child: BlocBuilder<TracksBloc, TracksState>(
                builder: (context, state) {
                  if (state is TracksSuccess) {
                    return state.track.courses.isEmpty
                        ? const Center(
                            child: Text("No Data Available"),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.only(
                                left: 24.w, right: 24.w, bottom: 12.h),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => NavigationHelper.navigateTo(
                                  AppRoute.COURSE_DETAILS,
                                  arguments: state.track.courses[index].id),
                              child: SizedBox(
                                width: 328.w,
                                height: 200.h,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      height: 95.h,
                                      width: 328.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.r),
                                            topRight: Radius.circular(12.r)),
                                        image: DecorationImage(
                                          image: NetworkImage(state
                                              .track.courses[index].image!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.h, left: 16.w, right: 16.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              style: IconButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.white,
                                              ),
                                              icon: Icon(
                                                size: 20.sp,
                                                AppIcons.heart,
                                                color: AppColors.secondary,
                                              ),
                                            ),
                                            Container(
                                              width: 44.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(40.r),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                    state.track.courses[index]
                                                        .rate!
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.w, vertical: 8.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              state.track.courses[index].title!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: AppColors.blue900,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10.r,
                                            backgroundImage: NetworkImage(state
                                                .track
                                                .courses[index]
                                                .instructors![0]
                                                .image!),
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            state.track.courses[index]
                                                .instructors![0].name!,
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            '\$${state.track.courses[index].price}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                            itemCount: state.track.courses.length,
                          );
                  } else if (state is TracksInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text("A&A"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

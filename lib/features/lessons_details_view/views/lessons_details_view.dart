import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/common/course_view/cubit/lectures_expansion_cubit.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/features/lessons_details_view/views/widgets/app_bar_component.dart';
import 'package:lms/features/lessons_details_view/views/widgets/content_tab.dart';
import 'package:lms/features/lessons_details_view/views/widgets/more_tab.dart';

import '../../../core/common/course_view/data/models/course_model.dart';

class LessonsDetailsView extends StatelessWidget {
  const LessonsDetailsView(
      {super.key, required this.id, required this.chapter, this.url = ''});

  final int id;
  final List<Chapter> chapter;
  final String url;

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = [
      const Tab(child: Text('Content')),
      const Tab(child: Text('More')),
    ];
    return BlocProvider(
      create: (context) => LecturesExpansionCubit(chapter.length),
      child: BlocBuilder<LecturesExpansionCubit, LecturesExpansionState>(
        builder: (context, state) {
          return SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBarComponent(id: id),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 16.h, 16.w, 14.h),
                      child: Text(
                        chapter[0].lessons[0].description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.gray900,
                        ),
                      ),
                    ),
                    TabBar(
                      unselectedLabelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelColor: AppColors.gray500,
                      indicatorColor: AppColors.primary,
                      dividerColor: AppColors.gray100,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.primary,
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      tabs: myTabs,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: SizedBox(
                          width: 359.w,
                          height: 724.h,
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ContentTab(chapters: chapter),
                              MoreTab(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

import 'about_section.dart';
import 'attachment_section.dart';

class LectureAbout extends StatefulWidget {
  const LectureAbout({Key? key}) : super(key: key);

  @override
  State<LectureAbout> createState() => _LectureAboutState();
}

class _LectureAboutState extends State<LectureAbout> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.r),
                        topLeft: Radius.circular(24.r),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        width: 375.w,
                        height: 476.h,
                        color: AppColors.white,
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lecture Info',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: AppColors.gray900,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    AppIcons.close_circle,
                                    size: 24.sp,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                            TabBar(
                              controller: _tabController,
                              tabs: [
                                Tab(
                                  text: 'About',
                                ),
                                Tab(
                                  text: 'Attachments',
                                ),
                              ],
                              labelColor: AppColors.primary,
                              unselectedLabelColor: AppColors.gray500,
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  // Content for About tab
                                  Center(
                                    child: About(),
                                  ),
                                  // Content for Attachments tab
                                  Center(
                                    child:Attachment(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Show Bottom MODEL',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

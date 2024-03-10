import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';

import 'about_section.dart';
import 'attachment_section.dart';

class CourseDetailsSheet extends StatefulWidget {
  const CourseDetailsSheet({super.key});

  @override
  _CourseDetailsSheetState createState() => _CourseDetailsSheetState();
}

class _CourseDetailsSheetState extends State<CourseDetailsSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 476.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r), topLeft: Radius.circular(24.r)),
      ),
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
            tabs: const [
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
              children: const [
                Center(
                  child: About(),
                ),
                Center(
                  child: Attachment(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/courses/view/widgets/corsesList.dart';
import 'package:lms/courses/view/widgets/searchField.dart';
import 'package:lms/utils/app_colors.dart';
import 'package:lms/utils/app_icons.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: AppColors.blue900,
          ),
        ),
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.violet50,
          ),
          icon: Icon(AppIcons.arrow_left),
          onPressed: (){
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SearchField(),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 1.h,
              color: Colors.grey[200],
            ),
          ),
          CourseList(),
        ],
      ),
    );
  }
}


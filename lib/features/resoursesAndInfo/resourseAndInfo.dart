import 'package:flutter/material.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/features/resoursesAndInfo/widgets/resourseDetails.dart';

import '../../core/common/course_view/view/widgets/widgets.dart';

class ResoursesAndInfo extends StatelessWidget {
  const ResoursesAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(title:'Resourses'),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: LineSeparated()),
          const SliverToBoxAdapter(child: Resourses(),),
        ],
      )

    );
  }
}

import 'package:flutter/material.dart';
import 'package:lms/core/common/custom_app_bar.dart';
import 'package:lms/features/resoursesAndInfo/widgets/resourseDetails.dart';

import '../../core/common/course_view/view/widgets/widgets.dart';

class ResourcesView extends StatelessWidget {
  const ResourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(title: 'Resources'),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: LineSeparated()),
            SliverToBoxAdapter(child: Resources()),
          ],
        ));
  }
}

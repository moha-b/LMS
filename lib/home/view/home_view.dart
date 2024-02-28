import 'package:flutter/material.dart';
import 'package:lms/home/view/widgets/bottom_nav_bar.dart';
import 'package:lms/home/view/widgets/main_tracks.dart';
import 'package:lms/home/view/widgets/popular_courses.dart';
import 'package:lms/home/view/widgets/slider_home_widgets.dart';
import 'package:lms/home/view/widgets/welcome_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(),
              HomeAds(),
              PopularCourses(),
              MainTracks(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarSection(),
      ),
    );
  }
}

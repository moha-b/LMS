import 'package:flutter/material.dart';
import 'package:lms/features/home/view/widgets/widgets.dart';

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

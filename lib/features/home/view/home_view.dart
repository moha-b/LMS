import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/bloc/home_bloc.dart';
import 'package:lms/features/home/data/repo/home_repo_impl.dart';
import 'package:lms/features/home/view/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeRepoImpl())..add(FetchCourses()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(),
                HomeAds(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeSuccess) {
                      return PopularCourses(list: state.data.courses);
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                MainTracks(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarSection(),
      ),
    );
  }
}

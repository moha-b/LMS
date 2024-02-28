import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/home/bloc/home_bloc.dart';
import 'package:lms/features/home/data/repo/home_repo_impl.dart';
import 'package:lms/features/home/view/widgets/widgets.dart';

import '../../../core/base/enums.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeRepoImpl())
        ..add(FetchCourses())
        ..add(FetchAds())
        ..add(FetchAllTracks()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.coursesState == RequestState.loaded) {
                      return HomeAds(adsModel: state.ads);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.coursesState == RequestState.loaded) {
                      return PopularCourses(list: state.courses!.courses);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.coursesState == RequestState.loaded) {
                      return MainTracks(list: state.allTracks);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBarSection(),
      ),
    );
  }
}

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
      create: (context) => HomeBloc(HomeRepoImpl())
        ..add(FetchCourses())
        ..add(FetchAds())
        ..add(FetchAllTracks()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.coursesState == RequestState.loaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeText(),
                      HomeAds(adsModel: state.ads),
                      // if (state.adsState == RequestState.loaded)
                      //   HomeAds(adsModel: state.ads),
                      if (state.coursesState == RequestState.loaded)
                        PopularCourses(list: state.courses!),
                      if (state.allTracksState == RequestState.loaded)
                        MainTracks(list: state.allTracks),
                    ],
                  ),
                );
              } else if (state.coursesState == RequestState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Erorrrrrrrrrrrrrrrrr'));
              }
            },
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarSection(),
      ),
    );
  }
}

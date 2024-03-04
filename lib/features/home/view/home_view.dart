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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeText(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    switch (state.adsState) {
                      case RequestState.loading:
                        return const SizedBox.shrink();
                      case RequestState.loaded:
                        return state.ads!.data.isNotEmpty
                            ? HomeAds(adsModel: state.ads)
                            : const Center(child: Text('Not Found'));
                      case RequestState.error:
                        return const Center(child: Text('Error'));
                    }
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.coursesState == RequestState.loaded) {
                      return PopularCourses(list: state.courses!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    switch (state.allTracksState) {
                      case RequestState.loading:
                        return const Center(child: CircularProgressIndicator());
                      case RequestState.loaded:
                        return state.allTracks!.tracks.isNotEmpty
                            ? MainTracks(list: state.allTracks)
                            : const Center(child: Text('Not Found'));
                      case RequestState.error:
                        return const Center(child: Text('Error'));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarSection(),
      ),
    );
  }
}

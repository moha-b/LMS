import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/network/network.dart';
import 'package:lms/features/courses/data/track_model.dart';
import 'package:meta/meta.dart';

part 'tracks_event.dart';
part 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  TracksBloc() : super(TracksInitial()) {
    on<SelectedTrack>((event, emit) async {
      try {
        var result = await NetworkHelper.instance.get(
          endPoint: EndPoints.GET_COURSES_BY_PACKAGE_ID,
          params: {
            "package_id": event.id,
          },
        );
        var json = result.data['data'];
        var data = TrackData.fromJson(json);
        emit(TracksSuccess(data));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}

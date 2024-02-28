part of 'widgets.dart';

class MainTracks extends StatefulWidget {
  const MainTracks({super.key, required this.list});
  final AllTracksModel? list;

  @override
  State<MainTracks> createState() => _MainTracksState();
}

class _MainTracksState extends State<MainTracks> {
  var firstHalfList;
  var secondHalfList;

  @override
  void initState() {
    super.initState();
    if (widget.list != null) {
      final tracks = widget.list!.tracks;
      final halfLength = tracks.length ~/ 2;
      firstHalfList = tracks.sublist(0, halfLength);
      secondHalfList = tracks.sublist(halfLength);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 44.h, top: 32.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, bottom: 16.h, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Main Tracks",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.gray900,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "View all",
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          MainTracksList(tracks: firstHalfList),
          SizedBox(height: 8.h),
          MainTracksList(tracks: secondHalfList),
        ],
      ),
    );
  }
}

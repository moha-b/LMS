part of 'widgets.dart';

class MainTracks extends StatefulWidget {
  const MainTracks({Key? key}) : super(key: key);

  @override
  State<MainTracks> createState() => _MainTracksState();
}

class _MainTracksState extends State<MainTracks> {
  List<dynamic> items = [
    'Soft Skills',
    'Maintenance Track',
    'Physical Courses',
    'Oil & Gas Training',
    'Civil Self Learning',
    'Management Training '
  ];
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
          MainTracksList(tracks: items),
          SizedBox(height: 8.h),
          MainTracksList(tracks: items),
        ],
      ),
    );
  }
}

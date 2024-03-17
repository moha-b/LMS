part of 'widgets.dart';

class MainTracksList extends StatelessWidget {
  MainTracksList({super.key, required this.tracks});

  List<AllTracksModel> tracks;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: tracks.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (tracks[index]?.title != null) {
            return GestureDetector(
              onTap: () {
                NavigationHelper.navigateTo(AppRoute.VIEW_ALL_COURSES,
                    arguments: {
                      'data': tracks,
                      'id': tracks[index].id,
                      'title': tracks[index].title,
                    });
              },
              child: Container(
                height: 38.h,
                padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.gray100,
                ),
                child: Text(
                  tracks[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.gray700,
                  ),
                ),
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          width: 8.w,
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class TrackTitleWidget extends StatelessWidget {
  const TrackTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, top: 27.h, bottom: 18.h),
      child: Text(
        'Soft Skills Track',
        style: TextStyle(
          color: AppColors.gray900,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

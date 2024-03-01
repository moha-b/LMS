part of 'widgets.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 12.h),
        child: SizedBox(
          height: 48.h,
          width: 327.w,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: AppColors.gray400,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                AppIcons.search_normal_1,
                size: 20.sp,
                color: AppColors.gray400,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

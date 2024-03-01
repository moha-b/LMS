part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => Size.fromHeight(106.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 0),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: AppColors.blue900,
          ),
        ),
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.violet50,
          ),
          icon: const Icon(
            AppIcons.arrow_left,
          ),
          onPressed: () {
            NavigationHelper.goBack();
          },
        ),
      ),
    );
  }
}

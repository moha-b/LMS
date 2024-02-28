part of 'widgets.dart';

class TabBottomNavBar extends StatelessWidget {
  TabBottomNavBar({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
  });

  int index;
  int selectedIndex;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedIndex == index)
          Container(
            width: 6.w,
            height: 6.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
          child: Icon(icon),
        ),
      ],
    );
  }
}

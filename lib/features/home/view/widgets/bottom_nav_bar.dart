part of 'widgets.dart';

class BottomNavigationBarSection extends StatefulWidget {
  const BottomNavigationBarSection({super.key});

  @override
  State<BottomNavigationBarSection> createState() =>
      _BottomNavigationBarSectionState();
}

class _BottomNavigationBarSectionState
    extends State<BottomNavigationBarSection> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: BottomNavigationBar(
        iconSize: 24.sp,
        selectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
        selectedIconTheme: const IconThemeData(
          color: AppColors.primary,
        ),
        unselectedItemColor: AppColors.gray400,
        selectedItemColor: AppColors.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: TabBottomNavBar(
              index: 0,
              selectedIndex: _selectedIndex,
              icon: AppIcons.discover,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: TabBottomNavBar(
              index: 1,
              selectedIndex: _selectedIndex,
              icon: AppIcons.video_play,
            ),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: TabBottomNavBar(
              index: 2,
              selectedIndex: _selectedIndex,
              icon: AppIcons.user,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

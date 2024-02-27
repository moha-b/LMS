import 'package:flutter/material.dart';
import 'package:lms/utils/app_icons.dart';

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
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.home),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.video_circle),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.profile_add),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
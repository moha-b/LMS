import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../navigation/navigation.dart';
import '../utils/app_colors.dart';
import '../utils/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.violet50,
        ),
        icon: const Icon(AppIcons.arrow_left),
        onPressed: () => NavigationHelper.goBack(),
      ),
    );
  }
}

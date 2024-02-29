import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000000),
            Color(0xFF0225FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              child: SvgPicture.asset(
                AppImages.loginShape,
                colorFilter: ColorFilter.mode(
                    AppColors.primary.withOpacity(0.1), BlendMode.srcIn),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Onboard 🤩',
                  style: TextStyle(
                      fontSize: 23.h,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
                SizedBox(height: 5.h),
                Text(
                  'We’re Glad to have you!',
                  style: TextStyle(fontSize: 16.h, color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

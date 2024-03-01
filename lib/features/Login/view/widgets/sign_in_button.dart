import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class SignInButton extends StatelessWidget {
  SignInButton({super.key, required this.onTap});

  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48.h, bottom: 24.h),
      child: GestureDetector(
        onTap: () async {
          onTap();
        },
        child: Container(
          width: 327.w,
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primary,
          ),
          child: Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

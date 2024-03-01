import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class RowCreateAccount extends StatelessWidget {
  const RowCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'New on our platform? ',
          style: TextStyle(
            color: AppColors.gray600,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Create an account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

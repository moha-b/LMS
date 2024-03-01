import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';

class RememberAndForget extends StatelessWidget {
  RememberAndForget({super.key, required this.check, required this.onTap});

  bool check;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: SizedBox(
              width: 20.w,
              height: 20.h,
              child: Center(
                child: check
                    ? Checkbox(
                        value: check,
                        onChanged: (value) {
                          onTap();
                        },
                        activeColor: AppColors.primary,
                        checkColor: Colors.white,
                      )
                    : Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: AppColors.gray200,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'Remember me',
            style: TextStyle(
              color: AppColors.black800,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      GestureDetector(
        child: Text(
          'Forget Password?',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColors.primary,
          ),
        ),
      ),
    ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_functions.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class ChoiceWithImage extends StatelessWidget {
  const ChoiceWithImage({super.key, required this.index, required this.images});
  final int index;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: AppColors.gray100,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Option ${capitalize(NumberToWordsEnglish.convert(index + 1))}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray800,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SizedBox(
              width: 299.w,
              child: Image.asset(
                images[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

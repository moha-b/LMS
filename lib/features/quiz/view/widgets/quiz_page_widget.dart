import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_functions.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/core/utils/app_images.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

import '../../../../core/utils/app_colors.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isImageVisible = true;
  bool isMultiChoice = false;
  String? selectedAnswer;
  Set<String> selectedMultiChoiceAnswers = {};

  List<String> quizImages = [
    AppImages.quizImage,
    '',
    AppImages.quizImage2,
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why People about skills required to be an Effective manager?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.gray900,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 202.h,
            child: Stack(
              children: [
                Center(
                  child: isImageVisible
                      ? Container(
                          height: 146.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              width: 1,
                              color: AppColors.gray200,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                AppImages.dummyImage2,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                Positioned(
                  bottom: 150.h,
                  left: 270.w,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 7,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.white,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isImageVisible = !isImageVisible;
                          });
                        },
                        icon: Icon(
                          isImageVisible
                              ? AppIcons.gallery_slash
                              : AppIcons.gallery,
                          size: 23.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
            child: Text(
              "Answers",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.gray400,
              ),
            ),
          ),
          SizedBox(
            height: 533.h,
            child: ListView.separated(
              itemBuilder: (context, index) => Container(
                height: quizImages[index] == '' ? 56.h : 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(width: 1, color: AppColors.gray200),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: quizImages[index] == '' ? 0 : 20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isMultiChoice) {
                                  if (selectedMultiChoiceAnswers
                                      .contains((index + 1).toString())) {
                                    selectedMultiChoiceAnswers
                                        .remove((index + 1).toString());
                                  } else {
                                    selectedMultiChoiceAnswers
                                        .add((index + 1).toString());
                                  }
                                } else {
                                  selectedAnswer = (index + 1).toString();
                                }
                              });
                            },
                            child: Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.gray100,
                                ),
                                color: isMultiChoice
                                    ? selectedMultiChoiceAnswers
                                            .contains((index + 1).toString())
                                        ? Colors.black
                                        : null
                                    : selectedAnswer == (index + 1).toString()
                                        ? Colors.black
                                        : null,
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
                      if (quizImages[index] != '')
                        Expanded(
                          child: SizedBox(
                            width: 299.w,
                            child: Image.asset(
                              quizImages[index],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: quizImages.length,
            ),
          ),
        ],
      ),
    );
  }
}

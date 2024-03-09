import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_icons.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/question.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.question}) : super(key: key);

  Question question;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isImageVisible = true;
  bool isMultiChoice = false;
  String? selectedAnswer;
  Set<String> selectedMultiChoiceAnswers = {};

  @override
  void initState() {
    super.initState();
    isMultiChoice = widget.question.multiple == 1;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.title,
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
                  child: widget.question.attachment?.url != ''
                      ? Container(
                          height: 146.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              width: 1,
                              color: AppColors.gray200,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.question.attachment?.url ?? ''),
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
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              height: widget.question.options?[index].attachment == null
                  ? 56.h
                  : 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 1,
                  color: selectedAnswer == (index + 1).toString() ||
                          selectedMultiChoiceAnswers
                              .contains((index + 1).toString())
                      ? AppColors.primary
                      : AppColors.gray200,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.w,
                  vertical: widget.question.options?[index].attachment == null
                      ? 0
                      : 20.h,
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
                                      ? AppColors.primary
                                      : null
                                  : selectedAnswer == (index + 1).toString()
                                      ? AppColors.primary
                                      : null,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          widget.question.options?[index].title ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    if (widget.question.options?[index].attachment != null)
                      Expanded(
                        child: SizedBox(
                          width: 299.w,
                          child: Image.network(
                            widget.question.attachment!.url,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: widget.question.options?.length ?? 0,
          ),
        ],
      ),
    );
  }
}

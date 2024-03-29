import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/core/utils/app_icons.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/model/question.dart';
import '../../data/model/submit_exam.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key, required this.question, required this.options})
      : super(key: key);
  Question question;
  Map options;

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
    if (widget.options[widget.question] == null) {
      Map<String, String> newEntries = {'${widget.question.id}': ''};
      widget.options.addAll(newEntries);
    }
    isMultiChoice = widget.question.multiple == 1;
    super.initState();
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
          if (widget.question.attachment?.url != null)
            SizedBox(
              height: isImageVisible ? 202.h : 50.h,
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
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.question.attachment!.url,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error)),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Positioned(
                    bottom: isImageVisible ? 150.h : 0.h,
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
            child: Row(
              children: [
                Text(
                  "Answers",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.gray400,
                  ),
                ),
                const Spacer(),
                Text(
                  isMultiChoice ? 'Multi Choice Question' : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: AppColors.error900,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  setData(widget.question.options![index].key, index);
                });
              },
              child: Container(
                height: widget.question.options![index].attachment == null
                    ? 56.h
                    : 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    width: 1,
                    color: isSelected(index)
                        ? AppColors.primary
                        : AppColors.gray200,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: widget.question.options![index].attachment == null
                        ? 0
                        : 20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: AppColors.gray100,
                              ),
                              color:
                                  isSelected(index) ? AppColors.primary : null,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            widget.question.options![index].title,
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
                            child: Container(
                              height: 146.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.gray200,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget
                                    .question.options?[index].attachment['url'],
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.error)),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: widget.question.options!.length,
          ),
        ],
      ),
    );
  }

  void setData(String title, int index) {
    if (isMultiChoice) {
      if (selectedMultiChoiceAnswers.contains(title)) {
        selectedMultiChoiceAnswers.remove(title);
      } else {
        selectedMultiChoiceAnswers.add(title);
      }
    } else {
      selectedAnswer = title;
    }
    widget.options[widget.question.id.toString()] = isMultiChoice
        ? SubmitExam.getStringFromList(selectedMultiChoiceAnswers)
        : selectedAnswer ?? '';
  }

  bool isSelected(int index) {
    String title = widget.question.options![index].key;
    if (isMultiChoice) {
      return selectedMultiChoiceAnswers.contains(title);
    } else {
      return selectedAnswer == title;
    }
  }
}

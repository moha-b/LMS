import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/course_view/view/widgets/widgets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';

class Attachment extends StatefulWidget {
  const Attachment({super.key});

  @override
  State<Attachment> createState() => _AttachmentState();
}

class _AttachmentState extends State<Attachment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 24.h,left: 24.w,right: 24.w,bottom: 130.h),
      child: Column(children: [
        Row(
          children: [
            Icon(
              AppIcons.video_circle,
              color: AppColors.gray400,
              size: 24.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Video.MP4',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    'File Size : 4MB',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              AppIcons.document_download,
              color: AppColors.primary,
              size: 17.sp,
            ),
          ],
        ),
        LineSeparated(),
        Row(
          children: [
            Icon(
              AppIcons.folder,
              color: AppColors.gray400,
              size: 24.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'File name.pdf',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    'File Size : 4MB',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              AppIcons.document_download,
              color: AppColors.primary,
              size: 17.sp,
            ),
          ],
        ),
        LineSeparated(),
        Row(
          children: [
            Icon(
              AppIcons.folder,
              color: AppColors.gray400,
              size: 24.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'File name.pdf',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray900,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    'File Size : 4MB',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              AppIcons.document_download,
              color: AppColors.primary,
              size: 17.sp,
            ),
          ],
        ),
      ],),
    );
  }
}

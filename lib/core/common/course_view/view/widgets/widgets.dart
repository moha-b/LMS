import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lms/core/common/course_view/cubit/course_view_cubit.dart';
import 'package:lms/core/common/course_view/cubit/lectures_expansion_cubit.dart';
import 'package:lms/core/common/course_view/data/models/course_model.dart';
import 'package:lms/core/navigation/navigation.dart';
import 'package:lms/core/utils/app_colors.dart';
import 'package:lms/core/utils/app_icons.dart';
import 'package:lms/core/utils/app_images.dart';
import 'package:lms/features/courses/view/widgets/widgets.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

import '../../data/models/course/course_status_model.dart';

part 'bottomSheet.dart';
part 'course_data_section.dart';
part 'course_details.dart';
part 'courses_you_might_like.dart';
part 'full_description.dart';
part 'lectures_details.dart';
part 'line_separated.dart';
part 'title_and_lectures.dart';
part 'video_course.dart';

part of 'widgets.dart';

class TitleAndLectures extends StatelessWidget {
  TitleAndLectures({Key? key, required this.data}) : super(key: key);

  final Course data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LecturesExpansionCubit(data.chapters.length),
      child: BlocBuilder<LecturesExpansionCubit, LecturesExpansionState>(
        builder: (context, state) {
          final lecturesExpansionCubit = context.read<LecturesExpansionCubit>();

          return Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 12.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.description.split('.').first}.',
                  style: TextStyle(
                    color: AppColors.gray800,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'See full description',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        NavigationHelper.navigateTo(AppRoute.FULL_DESCRIPTION,
                            arguments: data.description);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                      ),
                      color: AppColors.gray300,
                      iconSize: 25.sp,
                    ),
                  ],
                ),
                const LineSeparated(),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Curriculum',
                          style: TextStyle(
                            color: AppColors.gray900,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed:
                              lecturesExpansionCubit.toggleExpandedLectures,
                          icon: lecturesExpansionCubit.isExpandedLectures
                              ? Icon(
                                  AppIcons.arrow_right_3,
                                  size: 20.sp,
                                  color: AppColors.gray900,
                                )
                              : Icon(
                                  AppIcons.arrow_down_1,
                                  size: 20.sp,
                                  color: AppColors.gray900,
                                ),
                        ),
                      ],
                    ),
                    if (lecturesExpansionCubit.isExpandedLectures)
                      Container(
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
                        width: 327.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.gray50,
                        ),
                        child: ListView.separated(
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Chapter ${NumberToWordsEnglish.convert(index + 1)}',
                                    style: TextStyle(
                                      color: AppColors.gray900,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      lecturesExpansionCubit
                                          .toggleExpandedLecturesDetails(index);
                                    },
                                    child: Icon(
                                      lecturesExpansionCubit
                                              .isExpandedList[index]
                                          ? AppIcons.minus
                                          : AppIcons.add,
                                      size: 20.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              if (lecturesExpansionCubit.isExpandedList[index])
                                LecturesDetails(
                                    data: data.chapters[index].lessons),
                            ],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemCount: data.chapters.length,
                        ),
                      ),
                  ],
                ),
                const LineSeparated(),
              ],
            ),
          );
        },
      ),
    );
  }
}

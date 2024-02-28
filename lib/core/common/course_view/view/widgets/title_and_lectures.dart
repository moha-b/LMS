part of 'widgets.dart';

class TitleAndLectures extends StatefulWidget {
  const TitleAndLectures({Key? key}) : super(key: key);

  @override
  _TitleAndLecturesState createState() => _TitleAndLecturesState();
}

class _TitleAndLecturesState extends State<TitleAndLectures> {
  bool _isExpandedLectures = false;
  final List<bool> _isExpandedList = List.filled(5, false);

  void _toggleExpandedLecturesDetails(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  void _toggleExpandedLectures() {
    setState(() {
      _isExpandedLectures = !_isExpandedLectures;
    });
  }

  List<String> chapterList = [
    'one',
    'two',
    'three',
    'four',
    'five',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 12.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learn exactly how to become a wedding photographer, start a photo business of your own, and shoot better wedding photos.',
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
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const BottomSheetComponent();
                    },
                  );
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
                    onPressed: _toggleExpandedLectures,
                    icon: _isExpandedLectures
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
              if (_isExpandedLectures)
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
                              'Chapter ${chapterList[index]}',
                              style: TextStyle(
                                color: AppColors.gray900,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _toggleExpandedLecturesDetails(index);
                              },
                              child: Icon(
                                _isExpandedList[index]
                                    ? AppIcons.minus
                                    : AppIcons.add,
                                size: 20.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        if (_isExpandedList[index]) const LecturesDetails(),
                      ],
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12.h),
                    itemCount: 5,
                  ),
                ),
            ],
          ),
          const LineSeparated(),
        ],
      ),
    );
  }
}

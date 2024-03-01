part of 'widgets.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Color?> containerColors = List.generate(7, (index) => Colors.grey[100]);
  List<bool> isSelectedList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: SizedBox(
        height: 40.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 24.w),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < isSelectedList.length; i++) {
                  isSelectedList[i] = false;
                  containerColors[i] = Colors.grey[100];
                }
                isSelectedList[index] = true;
                containerColors[index] = AppColors.primary;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: containerColors[index],
              ),
              child: Text(
                'Soft Skills',
                style: isSelectedList[index]
                    ? TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: AppColors.white,
                      )
                    : TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.gray700,
                      ),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 8.w),
          itemCount: 7,
        ),
      ),
    );
  }
}

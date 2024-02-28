part of 'widgets.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Color?> containerColors = List.generate(7, (index) => Colors.grey[100]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24.w),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              containerColors[index] =
                  (containerColors[index] == Colors.grey[100]
                      ? AppColors.primary
                      : Colors.grey[100])!;
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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 8.w),
        itemCount: 7,
      ),
    );
  }
}

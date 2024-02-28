part of 'widgets.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({super.key});

  @override
  State<HomeAds> createState() => _SliderState();
}

class _SliderState extends State<HomeAds> {
  List images = [
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
    AppImages.banner,
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 175.h,
            width: 327.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primary,
            dotWidth: 8.w,
            dotHeight: 5.h,
            radius: 100.r,
            spacing: 2.w,
            dotColor: AppColors.gray200,
          ),
        ),
      ],
    );
  }
}

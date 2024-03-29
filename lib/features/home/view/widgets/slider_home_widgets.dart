part of 'widgets.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({super.key, required this.adsModel});
  final DartModel? adsModel;
  @override
  State<HomeAds> createState() => _SliderState();
}

class _SliderState extends State<HomeAds> {
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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.adsModel?.data.length ?? 1,
              itemBuilder: (context, index) {
                // return CachedNetworkImage(
                //   fit: BoxFit.fill,
                //   imageUrl: widget.adsModel!.data[index].image,
                // );
                return Image.asset(
                  AppImages.banner,
                  fit: BoxFit.cover,
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
          count: widget.adsModel?.data.length ?? 1,
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

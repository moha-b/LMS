import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms/utils/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({Key? key}) : super(key: key);

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20.h),
        SizedBox(
          height: 175.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.contain,
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 8.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: images.length,
          effect: WormEffect(
            dotWidth: 8.w,
            dotHeight: 5.h,
          ),
        ),
      ],
    );
  }
}

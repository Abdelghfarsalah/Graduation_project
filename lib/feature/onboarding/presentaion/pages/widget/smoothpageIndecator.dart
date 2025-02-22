import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Smoothpageindecator extends StatelessWidget {
  const Smoothpageindecator({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 4,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
          spacing: 15,
          radius: 100,
          dotWidth: 17.5.w,
          dotHeight: 17.5.h,
          paintStyle: PaintingStyle.stroke,
          strokeWidth: 1.5.w,
          dotColor: Color(0xff23262f80),
          activeDotColor: appColor.Primarycolor),
    );
  }
}

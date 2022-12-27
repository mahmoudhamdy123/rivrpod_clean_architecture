import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      required this.height,
      required this.viewportFraction,
      this.autoPlay = true})
      : super(key: key);
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;
  final double height;
  final double viewportFraction;
  final bool autoPlay;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      options: CarouselOptions(
        height: height,
        aspectRatio: 16 / 9,
        viewportFraction: viewportFraction,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: autoPlay,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

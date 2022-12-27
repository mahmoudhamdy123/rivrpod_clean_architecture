import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_clean_architecture/core/components/slider/custom_carousel_slider.dart';
import 'package:riverpod_clean_architecture/core/global/theme/app_color/app_colors_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';
import 'package:riverpod_clean_architecture/feature/home/presentation/components/now_playing_widget.dart';
import 'package:riverpod_clean_architecture/feature/home/presentation/components/trending_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 53.h,
              width: double.infinity,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "${AppString.stream} ",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).primaryColor)),
              TextSpan(
                  text: AppString.everywhere,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).primaryColorLight)),
            ])),
            SizedBox(
              height: 33.h,
            ),
            CustomCarouselSlider(
              itemCount: 10,
              height: 230.h,
              viewportFraction: 1,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  const NowPlayingWidget(),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              AppString.trending,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
            SizedBox(
              height: 29.h,
            ),
            CustomCarouselSlider(
              itemCount: 10,
              height: 405.h,
              autoPlay: false,
              viewportFraction: 0.75,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  const TrendingWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

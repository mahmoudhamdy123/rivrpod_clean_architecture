import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_clean_architecture/core/components/image/custom_cached_network_image.dart';
import 'package:riverpod_clean_architecture/core/global/theme/app_color/app_colors_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_icons.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 405.h,
      width: 311.w,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(36.r),
            child: CustomCachedNetworkImage(
              url:
                  "https://cdn.cdon.com/media-dynamic/images/product/cloud/store/movie/dvd/image5/doctor_strange_in_the_multiverse_of_madness_nordic-102019378-.jpg",
              height: 405.h,
              width: 311.w,
            ),
          ),
          Positioned(
              bottom: 20.h,
              child: Container(
                  width: 272.w,
                  height: 92.h,
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Center(
                      child: Text(
                    "Doctor Strange in the Multiverse of Madness",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Theme.of(context).primaryColorLight),
                  )))),
          Positioned(
              top: 10.h,
              right: 10.w,
              child: Container(
                  padding: EdgeInsets.only(left: 14.w, right: 10.w, top: 7.h, bottom: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "IMDb",
                        style: Theme.of(context)
                            .textTheme
                            .overline!
                            .copyWith(color: Theme.of(context).primaryColorLight),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColorsDark.amber,
                          ),
                          Text(
                            "7.0",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Theme.of(context).primaryColorLight),
                          )
                        ],
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}

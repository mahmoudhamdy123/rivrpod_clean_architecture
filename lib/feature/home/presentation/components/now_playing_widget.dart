import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_clean_architecture/core/components/image/custom_cached_network_image.dart';
import 'package:riverpod_clean_architecture/core/utils/app_icons.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      width: 394.w,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(36.r),
            child: CustomCachedNetworkImage(
                url:
                    "https://lumiere-a.akamaihd.net/v1/images/image_b3c7d632.jpeg?region=0,0,743,1100&width=480",
                height: 230.h,
                width: 394.w),
          ),
          Positioned(
              bottom: 10.h,
              left: 10.w,
              child: Container(
                padding: EdgeInsets.only(top: 13.h, bottom: 16.h, left: 14.w, right: 19.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(24.r)),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      AppIcons.playIcon,
                      width: 40.r,
                      height: 40.r,
                      fit: BoxFit.cover,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 24.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          AppString.continueWatching,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                        Text(
                          AppString.readyPlayerOne,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Theme.of(context).primaryColorLight),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

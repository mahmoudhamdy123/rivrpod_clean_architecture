import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_clean_architecture/core/global/theme/app_color/app_colors_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
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
          ]))
        ],
      ),
    );
  }
}

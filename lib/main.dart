import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_clean_architecture/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';
import 'package:riverpod_clean_architecture/feature/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:riverpod_clean_architecture/feature/rivrpod_example/example.dart';
import 'package:riverpod_clean_architecture/feature/rivrpod_example/hello_world_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(451, 978),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: AppString.appName,
            debugShowCheckedModeBanner: false,
            theme: getThemeDataDark(),
            // home: const MainLayoutScreen(),
            home: const Example(),
          );
        });
  }
}

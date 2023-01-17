import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_clean_architecture/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_string.dart';
import 'package:riverpod_clean_architecture/feature/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:riverpod_clean_architecture/feature/rivrpod_example/example.dart';
import 'package:riverpod_clean_architecture/feature/rivrpod_example/example_2/home_page_example_2.dart';
import 'package:riverpod_clean_architecture/feature/rivrpod_example/example_3/home_page_example_3.dart';

import 'feature/rivrpod_example/example_1/home_page_example_1.dart';

void main() {
  //Main project
  // runApp(const ProviderScope(child: MyApp()));
  //Example 1
  //runApp(const ProviderScope(child: Example1()));
  //Example 2
  // runApp(const ProviderScope(child: Example2()));
  //Example 3
  runApp(const ProviderScope(child: Example3()));
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
            home: const MainLayoutScreen(),
            // home: const Example(),
          );
        });
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example 1",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePageExample1(),
      // home: const Example(),
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example 1",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePageExample2(),
      // home: const Example(),
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example 1",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePageExample3(),
      // home: const Example(),
    );
  }
}

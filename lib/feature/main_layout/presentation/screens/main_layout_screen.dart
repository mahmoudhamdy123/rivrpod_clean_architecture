import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_clean_architecture/core/global/theme/app_color/app_colors_dark.dart';
import 'package:riverpod_clean_architecture/core/utils/app_icons.dart';
import 'package:riverpod_clean_architecture/feature/home/presentation/screens/home_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Find Movies',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 101.h,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.homeIcon,
                width: 53.r,
                height: 53.r,
                fit: BoxFit.cover,
                color: _selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.playIcon,
                width: 53.r,
                height: 53.r,
                fit: BoxFit.cover,
                color: _selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profileIcon,
                width: 53.r,
                height: 53.r,
                fit: BoxFit.cover,
                color: _selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

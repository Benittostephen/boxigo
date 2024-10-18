import 'package:boxigo/presentation/screen/bottom_nav_screen/reports_screen.dart';
import 'package:boxigo/presentation/screen/bottom_nav_screen/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'bottom_nav_screen/all_tab.dart';
import 'bottom_nav_screen/leads_screen.dart';
import '../../config/constants/const.dart';
import 'bottom_nav_screen/more_screen.dart';

class BottomNavHome extends StatelessWidget {
  const BottomNavHome({super.key});

  @override
  Widget build(BuildContext context) {
    // List of pages for each tab
    final List<Widget> pages = [
      const AllScreen(),
      const NewScreen(),
      const TasksScreen(),
      const ReportsScreen(),
      const MoreScreen(),
    ];

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.home),
          ),
          title: 'Home',
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.leaderboard),
          ),
          title: ("Leads"),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.calendar_today_outlined,
              size: 25,
            ),
          ),
          title: ("Tasks"),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryColor,
          //textStyle: TextStyle(fontSize: 15),
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.repeat_outlined,
              size: 30,
            ),
          ),
          title: ("Reports"),
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryColor,
          //textStyle:const TextStyle(fontSize: 15),
        ),
        PersistentBottomNavBarItem(
          icon: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.more_horiz_outlined,
              size: 30,
            ),
          ),
          title: ("More"),
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: secondaryColor,
          //textStyle: TextStyle(fontSize: 15),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: pages,
      items: navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle:
          NavBarStyle.simple, // Use a simple style without lines or zoom
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/views/create_post_screen.dart';
import 'package:twinku_blog/views/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final iconList = <IconData>[
    Icons.home,
    Icons.search_outlined,
    //Icons.add_circle,
    Icons.save_alt_sharp,
    Icons.person,
  ];

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    //CreatePostScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  var _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2281E3),
        child: Icon(Icons.add),

        onPressed: () {
          Get.to(
            () => CreatePostScreen(),
            fullscreenDialog: true,
          );
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        inactiveColor: Colors.grey,
        iconSize: 28.0,
        activeIndex: _bottomNavIndex,
        activeColor: Color(0xff2281E3),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
      body: _widgetOptions.elementAt(_bottomNavIndex),
    );
  }
}

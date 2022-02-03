// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/breaking_news_model.dart';
import 'package:twinku_blog/models/data.dart';
import 'package:twinku_blog/services/post_service.dart';
import 'package:twinku_blog/views/breaking_news_scroll.dart';
import 'package:twinku_blog/views/details_screen.dart';
import 'package:twinku_blog/views/other_news.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  late TabController _tabController;
  late BreakingNewsModel image;

  final tabList = ['All', 'information', 'Sports', 'Business', 'Culture'];

  @override
  void initState() {
    _pageController = PageController(initialPage: 2, viewportFraction: 0.8);
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            // right: 20.0,
            top: 25.0,
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello Sonia  👋',
                        style: TextStyle(
                            color: Color(0xFF0A1330),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(20), // Image radius
                            child: Image.asset(
                              'images/ff.jpeg',
                              scale: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 280.0,
                        height: 50.0,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF78768E),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: "Search",
                              fillColor: Color(0xFFF2F2F2)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          height: 50.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Icon(
                            Icons.settings_input_composite_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Breaking news',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xFF0A1330)),
                  ),
                  SizedBox(height: 18.0),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsScreen());
                    },
                    child: BreakingNewsScroll(
                      pageController: _pageController,
                      news: hotNews,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelPadding:
                        EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                    isScrollable: true,
                    controller: _tabController,
                    labelColor: Colors.blue,
                    indicator: PointTabIndicator(
                      position: PointTabIndicatorPosition.top,
                      color: Colors.blue,
                      //insets: EdgeInsets.only(bottom: 6),
                    ),
                    tabs: tabList.map((item) {
                      return Tab(
                        text: item,
                      );
                    }).toList(),
                  ),

                     OtherNews(),
                     SizedBox(
                       height: 10.0,
                     ),
                     OtherNews(),
                     SizedBox(
                       height: 10.0,
                     ),
                     OtherNews(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

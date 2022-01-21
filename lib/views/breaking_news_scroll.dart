// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twinku_blog/models/breaking_news_model.dart';
import 'package:twinku_blog/models/data.dart';

class BreakingNewsScroll extends StatelessWidget {

 final PageController? pageController;
 final List<BreakingNewsModel> ?news;

 const BreakingNewsScroll({Key? key,

  this.pageController, this.news})
     : super(key: key);

 _buildBreakingNews(BuildContext context, int index) {
  BreakingNewsModel newsModel = hotNews[index];
  return AnimatedBuilder(
    animation: pageController!,
    builder: (BuildContext context, Widget? child) {
     double value = 1;
     if(pageController!.position.haveDimensions){
      value = pageController!.page !- index;
      value = (1-(value.abs()*0.28)).clamp(0.0, 1.0);
     }
     return Center(
      child: SizedBox(height: Curves.easeInOut.transform(value)*295.0,
       child: child,
      ),
     );
    },
    child: Container(
     margin: EdgeInsets.all(10.0),
     height: 275.0,
     width: 287.0,
     decoration: BoxDecoration(
      boxShadow: [
       BoxShadow(
           color: Colors.black26, offset: Offset(0, 1), blurRadius: 6.0),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
     ),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
           borderRadius: BorderRadius.circular(15.0),
           child: Image.asset(newsModel.image!,
               height: 170.0, width: double.infinity, fit: BoxFit.cover),
          ),
         ),
         SizedBox(height: 14.0),
         SizedBox(
          width: 300.0,
          child: Padding(
           padding: const EdgeInsets.only(left: 12.0, right: 12.0),
           child: Text(
            newsModel.header!,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
           ),
          ),
         ),
         SizedBox(height: 14.0),
         Row(
          children: [
           Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ClipOval(
             child: SizedBox.fromSize(
              size: Size.fromRadius(13), // Image radius
              child: Image.asset(
               'images/ff.jpeg',
               scale: 20,
               fit: BoxFit.cover,
              ),
             ),
            ),
           ),
           SizedBox(width: 8.0),
           Text(
            newsModel.name!,
            style: TextStyle(
                color: Color(0xFF7B7B7B), fontWeight: FontWeight.w500),
           ),
           Spacer(),
           Icon(
            Icons.calendar_today,
            size: 15.0,
            color: Color(0xFF7B7B7B),
           ),
           SizedBox(width: 5.0),
           Padding(
            padding: const EdgeInsets.only(right: 16.5),
            child: Text(
             newsModel.date!,
             style: TextStyle(
                 color: Color(0xFF7B7B7B), fontWeight: FontWeight.w500),
            ),
           )
          ],
         ),
        ],
       ),
     ),
    ),
  );
 }

 @override
 Widget build(BuildContext context) {
  return SizedBox(
   height: 295.0,
   child: PageView.builder(
    controller: pageController,
    itemCount: news?.length,
    itemBuilder: (BuildContext context, int index) =>
        _buildBreakingNews(context, index),
   ),
  );
 }
}

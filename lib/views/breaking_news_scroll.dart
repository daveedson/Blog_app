// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BreakingNewsScroll extends StatelessWidget {
  final String? image;
  final String? header;
  final String? date;
  final String? name;
  final PageController? pageController;

  const BreakingNewsScroll(
      {Key? key,
      this.image,
      this.header,
      this.date,
      this.name,
      this.pageController})
      : super(key: key);

  _buildBreakingNews(BuildContext context, int index) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(image!,
                  height: 170.0, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 14.0),
          SizedBox(
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Text(
                header!,
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
                name!,
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
                  date!,
                  style: TextStyle(
                      color: Color(0xFF7B7B7B), fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 295.0,
      child: PageView.builder(
        controller: pageController,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) =>
            _buildBreakingNews(context, index),
      ),
    );
  }
}

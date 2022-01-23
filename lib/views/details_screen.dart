// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/breaking_news_model.dart';
import 'package:twinku_blog/models/data.dart';

class DetailsScreen extends StatefulWidget {
 BreakingNewsModel? newsModel;
 NewsDetailModel newsDetailModel = NewsDetailModel();
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
 final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     key: _key,
     endDrawer: Padding(

       padding: const EdgeInsets.only(right: 25.0,bottom: 600.0),
       child: Container(
        height: 150.0,
        width: 243.0,
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(15.0)
        ),
        child: Padding(
         padding: EdgeInsets.only(left: 16.5,top: 20.0,right: 3.0),
         child: Column(
          children: [
           Row(
            children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.edit_road_sharp,size: 30.0)),
             Text('Edit post',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 21.0),),
             Spacer(),
             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp,size: 20.0)),
            ],
           ),
           //SizedBox(height: 5.0),
           Divider(
            thickness: 1.0,
           ),
           Row(
            children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 30.0),color: Colors.red,),
             Text('Delete post',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 21.0,color: Colors.red),),
             Spacer(),
             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp,size: 20.0)),
            ],
           ),
          ],
         ),
        ),
       ),
     ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 64.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                   onTap: (){
                    Get.back(

                    );
                   },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: 40.0,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16.0,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            // spreadRadius: 10,
                            blurRadius: 3,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                        color: Color(0xFF0A1330),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                   onTap: (){
                    _key.currentState!.openEndDrawer();
                   },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: 40.0,
                      child: Icon(
                        Icons.menu,
                        size: 16.0,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            // spreadRadius: 10,
                            blurRadius: 3,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  constraints: BoxConstraints.expand(height: 250.0),
                  child: Stack(
                    children: [
                      Container(child: Hero(
                          tag: 'tag1',
                          child: Image.asset('images/ppw1.jpeg'))),
                      Positioned(
                        bottom: -16,
                        right: 25,
                        child: FittedBox(
                          child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Color(0xffF3F3F3),
                              child: Icon(
                                Icons.save_alt_sharp,
                                color: Color(0xFF8F8F8F),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text('Twinku raises N4.2m seed for Africa-wide expansion',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
              SizedBox(height: 10.0),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Color(0xFF7D7D7D),
                    size: 18.0,
                  ),
                  Text('2.2k', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.message_outlined,
                    color: Color(0xFF7D7D7D),
                    size: 18.0,
                  ),
                  Text('1.2k', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xFF7D7D7D),
                    size: 18.0,
                  ),
                  Text(
                    '12 Jan 2021',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(20), // Image radius
                      child: Image.asset(
                        'images/ff.jpeg',
                        scale: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'John jones',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7B7B7B),
                        fontSize: 18.0),
                  ),
                ],
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl urna mi egestas ipsum ut lorem adipiscing nisl consectetur. Posuere ut fames feugiat tempor vitae elementum aliquam iaculis auctor. Nisi laoreet sagittis tortor, netus fermentum. Et elit purus arcu felis, diam purus lacus, felis. Facilisis quam quam adipiscing nunc ridiculus nulla proin nunc at"
                  " Ipsum augue amet neque, aliquam adipiscing. Amet parturient elementum id tellus mauris ut sed. Gravida egestas enim rhoncus pellentesque tincidunt faucibus. Nunc, diam dui arcu viverra et auctor accumsan in justo. Nunc, lectus massa potenti vulputate at tincidunt vestibulum. Elit, nisi, at ac dui. Vitae nunc, faucibus id est id. Vitae lobortis maecenas at faucibus cras",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7B7B7B),
                      fontSize: 18.0)),
              Align(
               alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  height: 71,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: Colors.grey)
                            ],
                          ),
                          child: Row(
                            children: [
                              // IconButton(
                              //     icon: Icon(
                              //       Icons.face,
                              //       color: Colors.blueAccent,
                              //     ),
                              //     onPressed: () {}),
                              Expanded(
                                child: Container(
                                 width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintText: "Write a comment...",
                                          hintStyle:
                                              TextStyle(color:Color(0xff7B7B7B)),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   icon: Icon(Icons.photo_camera,
                              //       color: Colors.blueAccent),
                              //   onPressed: () {},
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(right: 7.0),
                                child: CircleAvatar(
                                 radius: 20.0,
                                  backgroundColor: Colors.lightBlue,
                                  child: IconButton(
                                    icon: Icon(Icons.send,
                                        color:Color(0xFF1251C4)),
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Container(
                      //   padding: const EdgeInsets.all(15.0),
                      //   decoration: BoxDecoration(
                      //       color: Colors.blueAccent, shape: BoxShape.circle),
                      //   child: InkWell(
                      //     child: Icon(
                      //       Icons.keyboard_voice,
                      //       color: Colors.white,
                      //     ),
                      //     onLongPress: () {},
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

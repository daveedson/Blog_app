// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 90.0,
        ),
        child: Column(
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
                Container(
                  height: 50.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0)),
                 child: Icon(Icons.settings_input_composite_outlined,color: Colors.white,),
                )
              ],
            ),
           SizedBox(height: 30.0),
           Text('Breaking news',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Color(0xFF0A1330)),)
          ],
        ),
      ),
    );
  }
}

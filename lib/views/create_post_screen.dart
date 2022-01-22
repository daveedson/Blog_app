// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 70.0),
        child: Column(
          children: [
            // SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                 onTap: ()=>Get.back(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Color(0xFF2281E3),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'Create post',
                  style: TextStyle(
                      color: Color(0xFF0A1330),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Save',
                  style: TextStyle(
                      color: Color(0xFF2281E3),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 42.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: 132.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xFF1251C4),
                  size: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            TextField(
              decoration: InputDecoration.collapsed(hintText: 'Title:'),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLines: 5,
              decoration: InputDecoration.collapsed(hintText: 'Body'),
            ),
          ],
        ),
      ),
    );
  }
}

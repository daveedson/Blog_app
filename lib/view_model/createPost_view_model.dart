// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/create_post_service.dart';

class CreatePostViewModel extends GetxController {
  String? title;
  String? body;

  Future<void> createNewPost() async {
    try {
      await CreatePostService().createPost(
        CreatePost(
          title: title,
          body: body,
        ),
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Operation Failed",
        middleText: e.toString(),
        backgroundColor: Color(0xFF2281E3),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
      );
    }
  }
}

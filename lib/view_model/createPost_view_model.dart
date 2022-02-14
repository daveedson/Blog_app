// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_null_comparison

import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/post_service.dart';

class CreatePostViewModel extends GetxController {
  String? title;
  String? body;
  File? image;
  final picker = ImagePicker();

  @override
  void onInit() {
    //in place of using stream builder.
    //this line of code is used to listen to the stream in the Post service class
    postsModel.bindStream(PostsService().getPost());
    super.onInit();
  }

  RxList<PostsModel> postsModel = RxList<PostsModel>([]);

  Future<void> createNewPost() async {
    try {
      await PostsService().createPost(
        PostsModel(
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

 void pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if( image != null ||  image!.path.isNotEmpty ||  image!.path != null){
     image = File(pickedFile!.path);
    }else{
     print('No image selected');
    }

    update();
  }
}

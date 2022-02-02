// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:twinku_blog/bindings/creatPost_binding.dart';
import 'package:twinku_blog/view_model/authentication_view_model.dart';
import 'package:twinku_blog/views/bottom_NavBar.dart';
import 'package:twinku_blog/views/create_post_screen.dart';
import 'package:twinku_blog/views/login_screen.dart';

import 'constants/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthViewModel());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/createPostScreen',
          page:  ()=>CreatePostScreen(),
          binding: CreatePostBinding(),
        )
      ],
      home: Center(
        child: CircularProgressIndicator(),
      ),
      //BottomNavBar()
    );
  }
}

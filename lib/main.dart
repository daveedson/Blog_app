import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:twinku_blog/view_model/authentication_view_model.dart';
import 'package:twinku_blog/views/bottom_NavBar.dart';
import 'package:twinku_blog/views/login_screen.dart';

import 'constants/constant.dart';

void main() async{
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: Center(child:  CircularProgressIndicator()),
      //BottomNavBar()

    );
  }
}



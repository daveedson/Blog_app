// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:twinku_blog/constants/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
   final TextEditingController _emailController = TextEditingController();

   final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 150.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Log in',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 70.0),
              TextField(
               controller: _emailController,
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
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF78768E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Email",
                    fillColor: Color(0xFFF2F2F2)),
              ),
              SizedBox(height: 15.0),
              TextField(
               controller: _passwordController,
               obscureText: true,
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
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xFF78768E),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Password",
                    fillColor: Color(0xFFF2F2F2)),
              ),
              SizedBox(height: 50.0),
              Row(
                children: [
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Remember me',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF344054)),
                  ),
                  Spacer(),
                  Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF2281E3)),
                  )
                ],
              ),
              SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                height: 51.0,
                child: ElevatedButton(
                  onPressed: () {
                   authController.login(_emailController.text.trim(),
                       _passwordController.text.trim());
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),
              SizedBox(height: 23.0),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or log in with",
                    style: TextStyle(color: Color(0xFF8E8CA3), fontSize: 15.0),
                  )),
              SizedBox(
                height: 33.4,
              ),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                  height: 50.0,
                  width: 50.0,
                  child: Image.asset(
                   'images/app.png',
                   scale: 12.0,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFF2F2F2)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                 ),
                  SizedBox(width: 13.0),
                  GestureDetector(
                   onTap: (){
                    authController.signInWithGoogle();
                   },
                    child: Container(
                     height: 50.0,
                     width: 50.0,
                     child: Image.asset(
                      'images/google.png',
                      scale: 12.0,
                     ),
                     decoration: BoxDecoration(
                         border: Border.all(color: Color(0xFFF2F2F2)),
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

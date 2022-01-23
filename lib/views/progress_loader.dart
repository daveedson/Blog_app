// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressLoader extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return SpinKitFadingCircle(
   color: Theme.of(context).primaryColor,
   size: 100.0,
  );
 }
}
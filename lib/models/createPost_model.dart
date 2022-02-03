// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class PostsModel {
  final title;
  final body;

  PostsModel({
    @required this.title,
    @required this.body,
  });

  Map<String,dynamic> toMap(){
   return {
    "title":title,
    "body":body,
   };
  }
}

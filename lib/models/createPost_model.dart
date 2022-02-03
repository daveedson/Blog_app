// ignore_for_file: prefer_typing_uninitialized_variables, empty_constructor_bodies, unnecessary_null_comparison

import 'package:flutter/foundation.dart';

class PostsModel {
  final title;
  final body;

  PostsModel({
    @required this.title,
    @required this.body,
  });

  factory PostsModel.fromMap(Map<String, dynamic> data) {
    final String title = data['title'];
    final String body = data['body'];

    return PostsModel(
      title: title,
      body: body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "body": body,
    };
  }
}

// ignore_for_file: avoid_print, use_function_type_syntax_for_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/api_path_to_fireStore_database.dart';
import 'package:twinku_blog/services/dataBase.dart';
import 'package:twinku_blog/services/fireStore_helperMethods.dart';
import 'package:twinku_blog/view_model/authentication_view_model.dart';

class PostsService implements DataBase {
  final authViewModel = Get.find<AuthViewModel>();

  final helperMethods = FireStoreHelperMethods();

  @override
  Future<void> createPost(PostsModel createPost) => helperMethods.setData(
      path: ApiPath.createPost(authViewModel.uid, 'post_abc'),
      data: createPost.toMap());

  @override
  Stream<List<PostsModel>> getPost() => helperMethods.getData(
        path: authViewModel.uid,
        builder: (data) => PostsModel.fromMap(data),
      );


}

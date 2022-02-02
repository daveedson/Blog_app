// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/api_path_to_fireStore_database.dart';
import 'package:twinku_blog/services/dataBase.dart';
import 'package:twinku_blog/view_model/authentication_view_model.dart';

class CreatePostService implements DataBase {


 final authViewModel = Get.find<AuthViewModel>();
  @override
  Future<void> createPost(CreatePost createPost) => _setData(path: ApiPath.post(authViewModel.uid, 'post_abc'), data: createPost.toMap());

  // //gets the path to firestore database
  // final path = ApiPath.post(uid!, 'post_abc');
  // //gets the documents reference in firestore database
  // final documentReference = FirebaseFirestore.instance.doc(path);
  //
  // //creates the data in cloud firestore
  // documentReference.set(createPost.toMap());


  //this method is simply for writing data to Firestore Database
  Future<void> _setData({required String path, required Map<String, dynamic> data}) async {
    final documentReference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await documentReference.set(data);
  }
}

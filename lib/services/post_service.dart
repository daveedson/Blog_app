// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/api_path_to_fireStore_database.dart';
import 'package:twinku_blog/services/dataBase.dart';
import 'package:twinku_blog/view_model/authentication_view_model.dart';

class PostsService implements DataBase {
  final authViewModel = Get.find<AuthViewModel>();

  @override
  Future<void> createPost(PostsModel createPost) => _setData(
      path: ApiPath.createPost(authViewModel.uid, 'post_abc'),
      data: createPost.toMap());

  // //gets the path to firestore database
  // final path = ApiPath.post(uid!, 'post_abc');
  // //gets the documents reference in firestore database
  // final documentReference = FirebaseFirestore.instance.doc(path);
  //
  // //creates the data in cloud firestore
  // documentReference.set(createPost.toMap());

  //this method is simply for writing data to Firestore Database
  Future<void> _setData(
      {required String path, required Map<String, dynamic> data}) async {
    final documentReference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await documentReference.set(data);
  }

  @override
  Stream<List<PostsModel>> getPost() {
    final path = ApiPath.getPost(authViewModel.uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapShots = reference.snapshots();
    return snapShots.map((snapshot) => snapshot.docs.map(
            (value) => PostsModel(
              title: value.data()['title'],
              body: value.data()['body'],
            ),
          )
          .toList(),
    );
  }
}

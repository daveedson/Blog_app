import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/api_path_to_fireStore_database.dart';
import 'package:twinku_blog/services/dataBase.dart';

class CreatePostService implements DataBase {
final String? uid;

  CreatePostService({this.uid});

  @override
  Future<void> createPost(CreatePost createPost) async {
   //gets the path to firestore database
   final path = ApiPath.post(uid!, 'post_abc');
   //gets the documents reference in firestore database
   final documentReference = FirebaseFirestore.instance.doc(path);

   //creates the data in cloud firestore
   documentReference.set(createPost.toMap());

  }
}

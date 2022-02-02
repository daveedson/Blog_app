import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/create_post_service.dart';

class CreatePostViewModel extends GetxController {
  String? title;
  String? body;


  Future<void> createNewPost() async {
    await CreatePostService().createPost(
      CreatePost(
        title: 'Delta to increase petrol Price',
        body: 'Due to high demand of petrol the delta state government has decided to increase fuel price',
      ),

    );
  }
}

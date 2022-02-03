// ignore_for_file: file_names

import 'package:twinku_blog/models/createPost_model.dart';

abstract class DataBase{
 Future<void> createPost(PostsModel createPost);
Stream<List<PostsModel>> getPost();
}
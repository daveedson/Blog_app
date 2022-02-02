import 'package:twinku_blog/models/createPost_model.dart';
import 'package:twinku_blog/services/dataBase.dart';

class CreatePostService implements DataBase {
final String? uid;

  CreatePostService({this.uid});

  @override
  Future<void> createPost(CreatePost createPost) async {

  }
}

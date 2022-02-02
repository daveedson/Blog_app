import 'package:get/get.dart';
import 'package:twinku_blog/view_model/createPost_view_model.dart';

class CreatePostBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(CreatePostViewModel());
  }

}
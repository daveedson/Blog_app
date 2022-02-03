// ignore_for_file: file_names

class ApiPath {
  static String createPost(String? uid, String postId) => "users/$uid/posts/$postId";
  static String getPost(String? uid)=> "users/$uid/posts";
}

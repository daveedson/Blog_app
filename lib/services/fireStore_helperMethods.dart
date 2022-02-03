// ignore_for_file: file_names, use_function_type_syntax_for_parameters, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelperMethods {
  //helper method to write to firestore database
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final documentReference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await documentReference.set(data);
  }

//helper method to read to firestore database
  Stream<List<T>> getData<T>({
    required String? path,
    required T builder(Map<String, dynamic> data),
  }) {
    final reference = FirebaseFirestore.instance.collection(path!);
    final snapShots = reference.snapshots();
    return snapShots.map(
      (snapshot) =>
          snapshot.docs.map((value) => builder(value.data())).toList(),
    );
  }
}

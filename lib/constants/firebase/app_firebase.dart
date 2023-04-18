import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirebase {
  const AppFirebase();

  static Future<void> loadData(
          {required String path,
          required Map<String, dynamic> data,
          String? docId}) async =>
      docId != null
          ? await FirebaseFirestore.instance
              .collection(path)
              .doc(docId)
              .set(data)
          : await FirebaseFirestore.instance.collection(path).doc().set(data);

  static String getCurrentUserId() => FirebaseAuth.instance.currentUser!.uid;

  static String createDocGetId(path) =>
      FirebaseFirestore.instance.collection(path).doc().id;
}

  // TODO: Remove if load works
  // static Future<void> loadData(
  //     {required String path,
  //     required Map<String, dynamic> data,
  //     String? docId}) async {
  //   if (docId != null) {
  //     await FirebaseFirestore.instance.collection(path).doc(docId).set(data);
  //     return;
  //   }
  //   await FirebaseFirestore.instance.collection(path).doc().set(data);
  // }
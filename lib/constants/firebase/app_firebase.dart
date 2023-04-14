import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirebase {
  const AppFirebase();

  // static Future<void> loadData(
  //         String collection, Map<String, dynamic> data) async =>
  //     await FirebaseFirestore.instance.collection(collection).doc().set(data);
  static Future<void> loadData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    // final colRef = FirebaseFirestore.instance.collection(path);
    // final invoiceId = colRef.doc().id;
    if (docId != null) {
      await FirebaseFirestore.instance.collection(path).doc(docId).set(data);
      return;
    }
    await FirebaseFirestore.instance.collection(path).doc().set(data);
  }

  static String getCurrentUserId() => FirebaseAuth.instance.currentUser!.uid;

  static String createDocGetId(path) =>
      FirebaseFirestore.instance.collection(path).doc().id;
}

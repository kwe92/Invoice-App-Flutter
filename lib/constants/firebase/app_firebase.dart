import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirebase {
  const AppFirebase();

  static Future<void> loadData(
          String collection, Map<String, Object> data) async =>
      await FirebaseFirestore.instance.collection('invoices').doc().set(data);

  static String getCurrentUserId() => FirebaseAuth.instance.currentUser!.uid;
}

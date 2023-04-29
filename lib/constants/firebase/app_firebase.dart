import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';

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

  static String getCurrentUserId() {
    print(FirebaseAuth.instance.currentUser!.uid);
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static String createDocGetId(path) =>
      FirebaseFirestore.instance.collection(path).doc().id;

  static Future<void> changeStatus(
      InvoiceFormModel invoice, String status) async {
    final document = await FirebaseFirestore.instance
        .collection('invoices')
        .doc(invoice.docId)
        .get();

    await document.reference.update({'status': status});
  }

  static Future<void> fetchAndListenInvoices(
      {required String collection,
      required String fieldName,
      required String orderBy,
      required Object isEqualTo,
      required callBack}) async {
    await FirebaseFirestore.instance
        .collection('invoices')
        .orderBy(orderBy)
        .where(fieldName, isEqualTo: isEqualTo)
        .snapshots()
        .listen(callBack);
  }
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
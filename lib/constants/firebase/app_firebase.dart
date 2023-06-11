import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';

class AppFirebase {
  const AppFirebase();
  // TODO: create record//TODO: create record } data
  static Future<void> loadData({required String path, required Map<String, dynamic> data, String? docId}) async => docId != null
      ? await FirebaseFirestore.instance.collection(path).doc(docId).set(data)
      : await FirebaseFirestore.instance.collection(path).doc().set(data);

  static Future<String> getCurrentUserId() async => FirebaseAuth.instance.currentUser!.uid;

  static Future<String> getCurrentUserInital() async => FirebaseAuth.instance.currentUser!.displayName != null
      ? FirebaseAuth.instance.currentUser!.displayName!.substring(0, 1)
      : FirebaseAuth.instance.currentUser!.email!.substring(0, 1);

  static String createDocGetId(path) => FirebaseFirestore.instance.collection(path).doc().id;

  static Future<void> changeStatus(InvoiceFormModel invoice, String status) async {
    final document = await FirebaseFirestore.instance.collection('invoices').doc(invoice.docId).get();

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

  static Future<void> reloadUser() async => FirebaseAuth.instance.currentUser!.reload();
}

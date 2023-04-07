// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';

class InvoicesModel extends ChangeNotifier {
  // TODO: Figure out how to make it a Map
  // Map<String, Object> _invoices = {};
  List _invoices = [];

  InvoicesModel() {
    _init();
  }

  Future<void> _init() async {
    FirebaseFirestore.instance
        .collection('invoices')
        .orderBy('createdAt')
        .snapshots()
        .listen(_invoicesCallback);
  }

  void _invoicesCallback(QuerySnapshot snapshot) {
    _invoices = [
      for (final document in snapshot.docs)
        InvoiceFormModel.fromJSON(document.data() as Map<String, Object>)
    ];

    notifyListeners();
  }
}

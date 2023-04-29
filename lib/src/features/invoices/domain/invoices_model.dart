// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invoiceapp/constants/enums/hash_keys.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';

class InvoicesModel extends ChangeNotifier {
  // TODO: Figure out how to make it a Map
  // Map<String, Object> _invoices = {};
  // List _invoices = [];
  Map _invoices = {};

  // List get invoices => _invoices;
  Map get invoices => _invoices;

  InvoicesModel() {
    AppFirebase.fetchAndListenInvoices(
        collection: 'invoices',
        fieldName: 'userId',
        orderBy: HashKeys.createdAt.name,
        isEqualTo: AppFirebase.getCurrentUserId(),
        callBack: _invoicesCallback);
  }
  void _invoicesCallback(QuerySnapshot snapshot) {
    _invoices = {
      for (final invoice in snapshot.docs as List<QueryDocumentSnapshot<Map?>>)
        invoice.data()![HashKeys.invoiceId.name]:
            InvoiceFormModel.fromJSON(invoice.data() as Map<String, dynamic>)
    };

    notifyListeners();
  }
}

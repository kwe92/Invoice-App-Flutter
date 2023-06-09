// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invoiceapp/constants/enums/hash_keys.dart';
import 'package:invoiceapp/constants/firebase/app_firebase.dart';
import 'package:invoiceapp/src/features/shared/records/get_records.dart';

class InvoicesModel extends ChangeNotifier {
  static Map _invoices = {};

  Map unfilteredInvoices = {};

  Map get invoices => _invoices;

  InvoicesModel() {
    _init();
  }
  void _invoicesCallback(QuerySnapshot snapshot) {
    _invoices = {
      for (final invoice in snapshot.docs as List<QueryDocumentSnapshot<Map?>>)
        invoice.data()![HashKeys.invoiceId.name]: CreateFormRecords.invoiceFormRecord(invoice.data() as Map<String, dynamic>)
      //     InvoiceFormModel.fromJSON(
      //   invoice.data() as Map<String, dynamic>,
      // )
    };

    notifyListeners();
  }

  void _init() => AppFirebase.getCurrentUserId().then(
        (userId) => AppFirebase.fetchAndListenInvoices(
          collection: 'invoices',
          fieldName: 'userId',
          orderBy: HashKeys.createdAt.name,
          isEqualTo: userId,
          callBack: _invoicesCallback,
        ),
      );

  static Iterable getInvoices(String status) => status == 'all'
      ? _invoices.values
      : status == 'pending'
          ? _invoices.values.where((invoice) => invoice.status == 'pending')
          : _invoices.values.where((invoice) => invoice.status == 'paid');
}

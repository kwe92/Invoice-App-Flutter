import 'package:cloud_firestore/cloud_firestore.dart';

class InvoiceFormModel {
  final invoiceId;
  final userId;
  final createdAt;
  final paymentDue;
  final status;
  final billToText;
  final billFromText;
  final listItems;
  final total;

  const InvoiceFormModel(
      {required this.invoiceId,
      required this.userId,
      required this.createdAt,
      required this.paymentDue,
      required this.status,
      required this.billFromText,
      required this.billToText,
      required this.listItems,
      required this.total});

  factory InvoiceFormModel.fromJSON(Map<String, dynamic> json) =>
      InvoiceFormModel(
          invoiceId: json['invoiceId'],
          userId: json['userId'],
          createdAt: json['createdAt'],
          paymentDue: json['paymentDue'].toDate(),
          status: ['status'],
          billFromText: ['billFromText'],
          billToText: ['billToText'],
          listItems: json['listItems'],
          total: json['total']);

  static DateTime _fromTimeStamp(timestamp) =>
      DateTime.fromMicrosecondsSinceEpoch(timestamp);
}

import 'package:cloud_firestore/cloud_firestore.dart';

class InvoiceFormModel {
  final String invoiceId;
  final String userId;
  final String docId;
  final DateTime createdAt;
  final DateTime paymentDue;
  final String status;
  final Map<String, dynamic> billToText;
  final Map<String, dynamic> billFromText;
  final List listItems;
  final double total;

  const InvoiceFormModel(
      {required this.invoiceId,
      required this.userId,
      required this.docId,
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
          docId: json['docId'],
          createdAt: json['createdAt'].toDate(),
          paymentDue: json['paymentDue'].toDate(),
          status: json['status'],
          billFromText: json['billFromText'],
          billToText: json['billToText'],
          listItems: json['listItems'],
          total: json['total']);

  Map<String, dynamic> toMap() => {
        'invoiceId': invoiceId,
        'userId': userId,
        'docId': docId,
        'createdAt': createdAt,
        'paymentDue': paymentDue,
        'status': status,
        'billToText': billToText,
        'billFromText': billFromText,
        'listItems': listItems,
        'total': total
      };
}

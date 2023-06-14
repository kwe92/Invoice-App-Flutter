import 'package:invoiceapp/constants/enums/hash_keys.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';

class InvoiceFormModel {
  final String invoiceId;
  final String userId;
  final String docId;
  final DateTime createdAt;
  final DateTime paymentDue;
  final String status;
  final Map<String, dynamic> billToText;
  final BillFromRecord billFromText;
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

  factory InvoiceFormModel.fromJSON(Map<String, dynamic> json) => InvoiceFormModel(
      invoiceId: json[HashKeys.invoiceId.name],
      userId: json[HashKeys.userId.name],
      docId: json[HashKeys.docId.name],
      createdAt: json[HashKeys.createdAt.name].toDate(),
      paymentDue: json[HashKeys.paymentDue.name].toDate(),
      status: json[HashKeys.status.name],
      billFromText: json[HashKeys.billFromText.name],
      billToText: json[HashKeys.billToText.name],
      listItems: json[HashKeys.listItems.name],
      total: json[HashKeys.total.name]);

  Map<String, dynamic> toMap() => {
        HashKeys.invoiceId.name: invoiceId,
        HashKeys.userId.name: userId,
        HashKeys.docId.name: docId,
        HashKeys.createdAt.name: createdAt,
        HashKeys.paymentDue.name: paymentDue,
        HashKeys.status.name: status,
        HashKeys.billFromText.name: billFromText,
        HashKeys.billToText.name: billToText,
        HashKeys.listItems.name: listItems,
        HashKeys.total.name: total
      };

  @override
  String toString() =>
      'InvoiceFormModel(invoiceId: $invoiceId, userId: $userId, docId: $docId, createdAt: $createdAt, paymentDue: $paymentDue, status: $status, billToText: $billToText, billFromText: $billFromText, listItems: $listItems, total: $total)';
}

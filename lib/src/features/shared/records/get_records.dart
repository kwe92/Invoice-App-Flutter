import 'package:invoiceapp/src/features/shared/records/records.dart';

class CreateFormRecords {
  static BillFromRecord billFromRecord(Map<String, dynamic> json) => (
        streetAdd: json['streetAdd'],
        city: json['city'],
        postCode: json['postCode'],
        country: json['country'],
      );

  static BillToRecord billToRecord(Map<String, dynamic> json) => (
        streetAdd: json['streetAdd'],
        city: json['city'],
        postCode: json['postCode'],
        country: json['country'],
        clientName: json['clientName'],
        clientEmail: json['clientEmail'],
        projectDesc: json['projectDesc'],
        date: json['date'],
        paymentTerm: json['paymentTerm']
      );

  static InvoiceFormRecord invoiceFormRecord(Map<String, dynamic> json) => (
        invoiceId: json['invoiceId'],
        userId: json['userId'],
        docId: json['docId'],
        createdAt: json['createdAt'].toDate(),
        paymentDue: json['paymentDue'].toDate(),
        status: json['status'],
        billToText: CreateFormRecords.billToRecord(json["billToText"]),
        billFromText: CreateFormRecords.billFromRecord(json["billFromText"]),
        listItems: json['listItems'],
        total: json['total'],
      );
}

import 'package:invoiceapp/src/features/shared/records/records.dart';

class CreateRecords {
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
        createdAt: json['createdAt'],
        paymentDue: json['paymentDue'],
        status: json['status'],
        billToText: json['billToText'],
        billFromText: json['billFromText'],
        listItems: json['listItems'],
        total: json['total'],
      );
}

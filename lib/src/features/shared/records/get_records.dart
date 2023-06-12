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

  static Map<String, dynamic> invoiceFormJSON(InvoiceFormRecord invoice) => {
        'invoiceId': invoice.invoiceId,
        'userId': invoice.userId,
        'docId': invoice.docId,
        'createdAt': invoice.createdAt,
        'paymentDue': invoice.paymentDue,
        'status': invoice.status,
        'billToText': CreateFormRecords.billToJSON(invoice.billToText),
        'billFromText': CreateFormRecords.billFromJSON(invoice.billFromText),
        'listItems': invoice.listItems,
        'total': invoice.total,
      };

  static Map<String, dynamic> billFromJSON(BillFromRecord billFrom) => {
        'streetAdd': billFrom.streetAdd,
        'city': billFrom.city,
        'postCode': billFrom.postCode,
        'country': billFrom.country,
      };
  static Map<String, dynamic> billToJSON(BillToRecord billTo) => {
        'streetAdd': billTo.streetAdd,
        'city': billTo.city,
        'postCode': billTo.postCode,
        'country': billTo.country,
        'clientName': billTo.clientName,
        'clientEmail': billTo.clientEmail,
        'projectDesc': billTo.projectDesc,
        'date': billTo.date,
        'paymentTerm': billTo.paymentTerm,
      };
}

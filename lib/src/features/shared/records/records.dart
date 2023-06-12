typedef BillFromRecord = ({
  String streetAdd,
  String city,
  String postCode,
  String country,
});

typedef BillToRecord = ({
  String streetAdd,
  String city,
  String postCode,
  String country,
  String clientName,
  String clientEmail,
  String projectDesc,
  String date,
  String paymentTerm
});

typedef InvoiceFormRecord = ({
  String invoiceId,
  String userId,
  String docId,
  DateTime createdAt,
  DateTime paymentDue,
  String status,
  BillToRecord billToText,
  BillFromRecord billFromText,
  List listItems,
  double total,
});

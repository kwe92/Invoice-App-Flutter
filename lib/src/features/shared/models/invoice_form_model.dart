class InvoiceFormModel {
  final String invoiceId;
  final String userId;
  final DateTime createdAt;
  final DateTime paymentDue;
  final String status;
  final Map<String, Object> billToText;
  final Map<String, Object> billFromText;
  final Map<String, Object> listItems;
  final double total;

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

  factory InvoiceFormModel.fromJSON(Map<String, Object> json) =>
      InvoiceFormModel(
          invoiceId: json['invoiceId'] as String,
          userId: json['userId'] as String,
          createdAt: DateTime.parse(json['createdAt'] as String),
          paymentDue: DateTime.parse(json['paymentDue'] as String),
          status: ['status'] as String,
          billFromText: ['billFromText'] as Map<String, Object>,
          billToText: ['billToText'] as Map<String, Object>,
          listItems: json['listItems'] as Map<String, Object>,
          total: double.parse(json['total'] as String));
}

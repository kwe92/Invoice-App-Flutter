import 'dart:convert';

class Invoice {
  final String id;
  final String fname;
  final String lname;
  final double invoiceAmnt;
  final String invoiceStatus;
  final DateTime date;
  const Invoice(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.invoiceAmnt,
      required this.invoiceStatus,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'invoiceAmnt': invoiceAmnt,
      'invoiceStatus': invoiceStatus,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      invoiceAmnt: map['invoiceAmnt']?.toDouble() ?? 0.0,
      invoiceStatus: map['invoiceStatus'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) =>
      Invoice.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Invoice &&
        other.id == id &&
        other.fname == fname &&
        other.lname == lname &&
        other.invoiceAmnt == invoiceAmnt &&
        other.invoiceStatus == invoiceStatus &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fname.hashCode ^
        lname.hashCode ^
        invoiceAmnt.hashCode ^
        invoiceStatus.hashCode ^
        date.hashCode;
  }
}

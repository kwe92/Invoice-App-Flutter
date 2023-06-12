import 'package:flutter/material.dart';

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

typedef ThemeShadesRecord = ({
  Color shade0,
  Color shade1,
  Color shade2,
  Color shade3,
});

typedef OtherColorsRecord = ({
  Color purple0,
  Color purple1,
  Color red0,
  Color red1,
  Color blue0,
});

typedef InvoiceItemRecord = ({
  String itemName,
  double quantity,
  double price,
  double total,
});

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item.dart';

class ItemListModel extends ChangeNotifier {
  List<CustomListItem> _items = [];

  List<CustomListItem> get items => _items;

  void addItem(CustomListItem item) {
    _items = [..._items, item];
    notifyListeners();
  }
}

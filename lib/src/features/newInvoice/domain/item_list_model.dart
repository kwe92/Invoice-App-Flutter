// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item.dart';

class ItemListModel extends ChangeNotifier {
  final Map<int, CustomListItem> _items = {};
  Map<int, CustomListItem> get items => _items;

  void addItem(Map<int, CustomListItem> entry) {
    _items.addAll(entry);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.remove(index);
    notifyListeners();
  }
}

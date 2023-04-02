// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item_stateful.dart';

class ItemListModel extends ChangeNotifier {
  final Map<int, CustomListItemStateful> _items = {};
  Map<int, CustomListItemStateful> get items => _items;

  void addItem(Map<int, CustomListItemStateful> entry) {
    _items.addAll(entry);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.remove(index);
    notifyListeners();
  }
}

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item.dart';

class ItemListModel extends ChangeNotifier {
  final Map<int, CustomListItem> _items = {};
  final Map<int, CustomListItemModel> _itemModels = {};

  Map<int, CustomListItem> get items => _items;
  Map<int, CustomListItemModel> get itemModels => _itemModels;

  void addItem(Map<int, CustomListItem> entry) {
    _items.addAll(entry);
    notifyListeners();
  }

  void addItemModel(Map<int, CustomListItemModel> entry) {
    _itemModels.addAll(entry);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.remove(index);
    notifyListeners();
    _removeItemModel(index);
  }

  void _removeItemModel(int index) {
    _itemModels.remove(index);
    notifyListeners();
  }
}

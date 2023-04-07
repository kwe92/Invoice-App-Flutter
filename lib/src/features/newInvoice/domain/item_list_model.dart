// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/newInvoice/domain/list_item_model.dart';
import 'package:invoiceapp/src/features/newInvoice/presentation/list_item.dart';

class ItemListModel extends ChangeNotifier {
  Map<String, CustomListItem> _items = {};
  Map<String, CustomListItemModel> _itemModels = {};

  Map<String, CustomListItem> get items => _items;
  Map<String, CustomListItemModel> get itemModels => _itemModels;

  void addItem(Map<String, CustomListItem> entry) {
    _items.addAll(entry);
    notifyListeners();
  }

  void addItemModel(Map<String, CustomListItemModel> entry) {
    _itemModels.addAll(entry);
    notifyListeners();
  }

  void removeItem(String index) {
    _items.remove(index);
    notifyListeners();
    _removeItemModel(index);
  }

  void clearItemsState() {
    _itemModels = {};
    _items = {};

    notifyListeners();
  }

  void _removeItemModel(String index) {
    _itemModels.remove(index);
    notifyListeners();
  }
}

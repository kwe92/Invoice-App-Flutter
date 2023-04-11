// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class CustomListItemModel extends ChangeNotifier {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _totalController = TextEditingController();

  TextEditingController get itemNameController => _itemNameController;
  TextEditingController get quantityController => _quantityController;
  TextEditingController get priceController => _priceController;
  TextEditingController get totalController => _totalController;

  Map<String, String> get allControllerText {
    return {
      'itemName': itemNameController.text,
      'quantity': quantityController.text,
      ' price': priceController.text,
      'total': totalController.text,
    };
  }

  void clearItemNameController() {
    _itemNameController.clear();
    notifyListeners();
  }

  void clearQuantityController() {
    _quantityController.clear();
    notifyListeners();
  }

  void clearPriceController() {
    _priceController.clear();
    notifyListeners();
  }

  void clearTotalController() {
    _totalController.clear();
    notifyListeners();
  }

  void loadControllers(Map<String, dynamic> item) {
    print('ITEM FROM loadControllers:$item');
    quantityController.text = item['quantity'] ?? '';
    itemNameController.text = item['itemName'] ?? '';
    // TODO: Fix the price, it is not displaying even though there is data
    priceController.text = item['price'] ?? '';
    totalController.text = item['total'] ?? '';
    notifyListeners();
  }
}

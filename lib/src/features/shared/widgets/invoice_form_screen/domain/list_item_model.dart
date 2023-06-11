// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/constants/enums/hash_keys.dart';

class CustomListItemModel extends ChangeNotifier {
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _totalController = TextEditingController();

  TextEditingController get itemNameController => _itemNameController;
  TextEditingController get quantityController => _quantityController;
  TextEditingController get priceController => _priceController;
  TextEditingController get totalController => _totalController;

  //TODO: create record
  Map<String, String> get allControllerText {
    return {
      HashKeys.itemName.name: itemNameController.text,
      HashKeys.quantity.name: quantityController.text,
      HashKeys.price.name: priceController.text,
      HashKeys.total.name: double.parse(totalController.text).toStringAsFixed(2),
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
    quantityController.text = item[HashKeys.quantity.name] ?? '';
    itemNameController.text = item[HashKeys.itemName.name] ?? '';
    priceController.text = item[HashKeys.price.name] ?? '';
    totalController.text = item[HashKeys.total.name] ?? '';
    notifyListeners();
  }

  void setTotalController(quantity, price) {
    totalController.text = (num.parse(quantity) * num.parse(price)).toStringAsFixed(2);
    notifyListeners();
  }
}

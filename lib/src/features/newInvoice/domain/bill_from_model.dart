// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class BillFromModel extends ChangeNotifier {
  TextEditingController _streetAddController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  TextEditingController get streetAddController => _streetAddController;
  TextEditingController get cityController => _cityController;
  TextEditingController get postCodeController => _postCodeController;
  TextEditingController get countryController => _countryController;

  Map<String, String> get allControllerText {
    return {
      'streetAdd': streetAddController.text,
      'city': cityController.text,
      'postCode': postCodeController.text,
      'country': countryController.text
    };
  }

  void clearStreetController() {
    _streetAddController.clear();
    notifyListeners();
  }

  void clearCityController() {
    _cityController.clear();
    notifyListeners();
  }

  void clearPostCodeController() {
    _postCodeController.clear();
    notifyListeners();
  }

  void clearCountryController() {
    _countryController.clear();
    notifyListeners();
  }

  void clearAllControllers() {
    clearCityController();
    clearCountryController();
    clearPostCodeController();
    clearStreetController();
  }
}

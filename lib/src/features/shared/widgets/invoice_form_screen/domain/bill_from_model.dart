// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/models/invoice_form_model.dart';

class BillFromModel extends ChangeNotifier {
  TextEditingController _streetAddController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  // TODO: Implement edit
  bool _edit = false;

  TextEditingController get streetAddController => _streetAddController;
  TextEditingController get cityController => _cityController;
  TextEditingController get postCodeController => _postCodeController;
  TextEditingController get countryController => _countryController;
  bool get edit => _edit;

  Map<String, String> get allControllerText => {
        // TODO: Place all Hash Table keys that are repeated in an ENUM
        'streetAdd': streetAddController.text,
        'city': cityController.text,
        'postCode': postCodeController.text,
        'country': countryController.text
      };

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
    notifyListeners();
  }

  void loadControllers(InvoiceFormModel invoice) {
    streetAddController.text = invoice.billFromText['streetAdd'];
    cityController.text = invoice.billFromText['city'];
    postCodeController.text = invoice.billFromText['postCode'];
    countryController.text = invoice.billFromText['country'];
    notifyListeners();
  }
}

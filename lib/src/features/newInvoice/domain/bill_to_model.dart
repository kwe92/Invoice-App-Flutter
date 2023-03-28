// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class BillToModel extends ChangeNotifier {
  TextEditingController _streetAddController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _clientNameController = TextEditingController();
  TextEditingController _clientEmailController = TextEditingController();
  TextEditingController _projectDescController = TextEditingController();

  TextEditingController get streetAddController => _streetAddController;
  TextEditingController get cityController => _cityController;
  TextEditingController get postCodeController => _postCodeController;
  TextEditingController get countryController => _countryController;

  TextEditingController get clientNameController => _clientNameController;
  TextEditingController get clientEmailController => _clientEmailController;
  TextEditingController get projectDescController => _projectDescController;

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

  void clearClientNameController() {
    _clientNameController.clear();
    notifyListeners();
  }

  void clearClientEmailController() {
    _clientEmailController.clear();
    notifyListeners();
  }

  void clearProjectDescController() {
    _projectDescController.clear();
    notifyListeners();
  }

  void clearAllControllers() {
    clearCityController();
    clearCountryController();
    clearPostCodeController();
    clearStreetController();
    clearClientNameController();
    clearClientEmailController();
    clearProjectDescController();
  }
}

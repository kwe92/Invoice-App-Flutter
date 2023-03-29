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
  TextEditingController _dateController = TextEditingController();
  TextEditingController get streetAddController => _streetAddController;
  TextEditingController get cityController => _cityController;
  TextEditingController get postCodeController => _postCodeController;
  TextEditingController get countryController => _countryController;
  TextEditingController get clientNameController => _clientNameController;
  TextEditingController get clientEmailController => _clientEmailController;
  TextEditingController get projectDescController => _projectDescController;
  TextEditingController get dateController => _dateController;

  void setDateControllerText(String date) =>
      date.isNotEmpty ? dateController.text = date : null;

  void clearStreetController() {
    streetAddController.clear();
    notifyListeners();
  }

  void clearCityController() {
    cityController.clear();
    notifyListeners();
  }

  void clearPostCodeController() {
    postCodeController.clear();
    notifyListeners();
  }

  void clearCountryController() {
    countryController.clear();
    notifyListeners();
  }

  void clearClientNameController() {
    clientNameController.clear();
    notifyListeners();
  }

  void clearClientEmailController() {
    clientEmailController.clear();
    notifyListeners();
  }

  void clearProjectDescController() {
    projectDescController.clear();
    notifyListeners();
  }

  void clearDateController() {
    dateController.clear();
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
    clearDateController();
  }
}

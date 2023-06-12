// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:invoiceapp/src/features/shared/records/records.dart';

class BillToModel extends ChangeNotifier {
  TextEditingController _streetAddController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _clientNameController = TextEditingController();
  TextEditingController _clientEmailController = TextEditingController();
  TextEditingController _projectDescController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _dropDownMenuController = TextEditingController();

  TextEditingController get streetAddController => _streetAddController;
  TextEditingController get cityController => _cityController;
  TextEditingController get postCodeController => _postCodeController;
  TextEditingController get countryController => _countryController;
  TextEditingController get clientNameController => _clientNameController;
  TextEditingController get clientEmailController => _clientEmailController;
  TextEditingController get projectDescController => _projectDescController;
  TextEditingController get dateController => _dateController;
  TextEditingController get dropDownMenuController => _dropDownMenuController;

//TODO: create record
  Map<String, String> get allControllerText => {
        'streetAdd': streetAddController.text,
        'city': cityController.text,
        'postCode': postCodeController.text,
        'country': countryController.text,
        'clientName': clientNameController.text,
        'clientEmail': clientEmailController.text,
        'projectDesc': projectDescController.text,
        'date': dateController.text,
        'paymentTerm': dropDownMenuController.text,
      };

  void setDateControllerText(String date) => date.isNotEmpty ? dateController.text = date : null;

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

  void clearDropDownMenuController() {
    dropDownMenuController.clear();
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
    clearDropDownMenuController();
    notifyListeners();
  }

  void loadControllers(InvoiceFormRecord invoice) {
    streetAddController.text = invoice.billToText.streetAdd;
    cityController.text = invoice.billToText.city;
    postCodeController.text = invoice.billToText.postCode;
    countryController.text = invoice.billToText.country;
    clientNameController.text = invoice.billToText.clientName;
    clientEmailController.text = invoice.billToText.clientEmail;
    projectDescController.text = invoice.billToText.projectDesc;
    dateController.text = invoice.billToText.date;
    dropDownMenuController.text = invoice.billToText.paymentTerm;
    notifyListeners();
  }
}

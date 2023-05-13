import 'package:flutter/widgets.dart';

class FilterButtonModel extends ChangeNotifier {
  static final List<String> dropdownOptions = <String>['all', 'pending', 'paid'];
  String dropdownValue = dropdownOptions.first;

  void setValue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}

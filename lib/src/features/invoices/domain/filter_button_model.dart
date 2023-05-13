import 'package:flutter/widgets.dart';

class FilterButtonModel extends ChangeNotifier {
  static final List<String> list = <String>['all', 'pending', 'paid'];
  String dropdownValue = list.first;

  void setValue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}

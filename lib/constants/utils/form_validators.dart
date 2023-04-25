// Form Field Validators

// TODO: Expand RegEx's
// TODO: Fix _textPattern, its not working correctly. allows user to still inter text with numbers
// ?? Need to add validators: date, email, payment term
class FormValidators {
  static const _emptyText = 'Can not be empty.';

  static const _textNumPattern = '^[a-zA-Z0-9 ]*\$';
  static const _textPattern = '^[a-zA-Z]*\$';
  static const _naturalNumbersPattern = '^[0-9]*\$';

  static final RegExp _textNumRegex = RegExp(_textNumPattern);
  static final RegExp _textRegex = RegExp(_textPattern);
  static final RegExp _numbersRegex = RegExp(_naturalNumbersPattern);

  static String? textNumField(String? s) {
    if (s != null) {
      print('${_textNumRegex.hasMatch(s)}');
    }
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_textNumRegex.hasMatch(s)) {
      return 'Can not contain special characters.';
    }
    return null;
  }

  static String? textField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_textRegex.hasMatch(s)) {
      return 'Please enter a valid value.';
    }
    return null;
  }

  static String? numberField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_numbersRegex.hasMatch(s)) {
      return 'Enter numbers 0 - 9.';
    }
    return null;
  }
}

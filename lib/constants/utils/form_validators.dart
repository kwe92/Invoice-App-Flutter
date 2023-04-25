// Form Field Validators

// TODO: Expand RegEx's
// TODO: Fix _textPattern, its not working correctly. allows user to still inter text with numbers
// ?? Need to add validators: date, email, payment term
class FormValidators {
  static const _emptyText = 'Can not be empty.';

  static const _textNumPattern = r'^[a-zA-Z0-9 ]*$';
  static const _textPattern = r'^[a-zA-Z]*$';
  static const _naturalNumbersPattern = r'^[0-9]+-[0-9]*$';
  static const _emailPattern = r'^[a-zA-Z0-9]+@[a-zA-Z]+.[a-zA-Z]*$';
  static const _datePattern = r'^[0-9]+-[0-9]+-[0-9]*$';

  static final RegExp _textNumRegex = RegExp(_textNumPattern);
  static final RegExp _textRegex = RegExp(_textPattern);
  static final RegExp _numbersRegex = RegExp(_naturalNumbersPattern);
  static final RegExp _emailRegex = RegExp(_emailPattern);
  static final RegExp _dateRegex = RegExp(_datePattern);

  static String? textNumField(String? s) {
    if (s != null) {
      print('${_textNumRegex.hasMatch(s)}');
    }
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_textNumRegex.hasMatch(s)) {
      return 'Letters A-Z and numbers 0-9';
    }
    return null;
  }

  static String? textField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_textRegex.hasMatch(s)) {
      return 'Letters A-Z, no spaces.';
    }
    return null;
  }

  static String? numberField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_numbersRegex.hasMatch(s)) {
      return 'Numbers 0 - 9, no spaces.';
    }
    return null;
  }

  static String? emailField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_emailRegex.hasMatch(s)) {
      return 'Invalid email address.';
    }
    return null;
  }

  static String? dateField(String? s) {
    if (s == null || s.isEmpty) {
      return _emptyText;
    }
    if (!_dateRegex.hasMatch(s)) {
      return 'Invalid date.';
    }
    return null;
  }
}

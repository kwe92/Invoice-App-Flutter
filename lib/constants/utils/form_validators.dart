// TODO: Expand RegEx's

class FormValidators {
  static const emptyText = 'Can not be empty.';

  static const textNumPattern = '^[a-zA-Z0-9_.- ]*\$';

// TODO: Fix textPattern, its not working correctly. allows user to still inter text with numbers

  static const textPattern = '^[a-zA-Z]';

  static const naturalNumbersPattern = '^[0-9]*\$';

  static final RegExp textNumRegex = RegExp(textNumPattern);
  static final RegExp textRegex = RegExp(textPattern);
  static final RegExp numbersRegex = RegExp(naturalNumbersPattern);

  static String? textNumField(String? s) {
    if (s != null) {
      print('${textNumRegex.hasMatch(s)}');
    }
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!textNumRegex.hasMatch(s)) {
      return 'Can not contain special characters.';
    }
    return null;
  }

  static String? textField(String? s) {
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!textRegex.hasMatch(s)) {
      return 'Please enter a valid value.';
    }
    return null;
  }

  static String? numberField(String? s) {
    if (s == null || s.isEmpty) {
      return emptyText;
    }
    if (!numbersRegex.hasMatch(s)) {
      return 'Enter numbers 0 - 9.';
    }
    return null;
  }
}

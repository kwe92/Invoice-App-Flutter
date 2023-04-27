// Form Field Validators

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

  static String? textNumField(String? s) => s == null || s.isEmpty
      ? _emptyText
      : !_textNumRegex.hasMatch(s)
          ? 'Letters A-Z and numbers 0-9'
          : null;

  static String? textField(String? s) => s == null || s.isEmpty
      ? _emptyText
      : !_textRegex.hasMatch(s)
          ? 'Letters A-Z, no spaces.'
          : null;

  static String? numberField(String? s) => s == null || s.isEmpty
      ? _emptyText
      : !_numbersRegex.hasMatch(s)
          ? 'Numbers 0 - 9, no spaces.'
          : null;

  static String? emailField(String? s) => s == null || s.isEmpty
      ? _emptyText
      : !_emailRegex.hasMatch(s)
          ? 'Invalid email address.'
          : null;

  static String? dateField(String? s) => s == null || s.isEmpty
      ? _emptyText
      : !_dateRegex.hasMatch(s)
          ? 'Invalid date'
          : null;
}

import 'package:intl/intl.dart';

class LocaleFormatter {
  static final _numberFormatter = NumberFormat('###,###.00#', 'en-US');
  static String formatDouble(double x) => _numberFormatter.format(x);
}

class DateFormatter {
  static String dateTimeToString(DateTime date) =>
      '${date.month.toString()}-${date.day.toString()}-${date.year.toString()}';
}

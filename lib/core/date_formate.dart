import 'package:intl/intl.dart';

String dateTimeFormate(DateTime date) {
  DateFormat formatter = DateFormat('dd MMM yyyy');
  final String formatted = formatter.format(date);
  return formatted;
}

String dateTime(DateTime date) {
  DateFormat formatter = DateFormat('dd MMM, yyyy hh:mm a');
  final String formatted = formatter.format(date.toLocal());
  return formatted;
}

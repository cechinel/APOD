import 'package:intl/intl.dart';

String formatDate(DateTime date, [String? pattern]) {
  return DateFormat(pattern ?? 'MM/dd/yyyy').format(date);
}

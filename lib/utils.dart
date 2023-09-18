import 'package:intl/intl.dart';

class Utils {
  static String toDateTime(DateTime dateTime) {
    final date = toDate(dateTime);
    final time = toTime(dateTime);
    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat('EEEEEE, dd MMMM', 'pt_BR').format(dateTime);
    return date;
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm('pt_BR').format(dateTime);
    return time;
  }
}

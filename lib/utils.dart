import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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

  static String generateRandomMongoId() {
    var bytes = utf8.encode(DateTime.now().toIso8601String());
    var digest = sha256.convert(bytes);
    return digest.toString().substring(0, 24);
  }
}

import 'package:intl/intl.dart';

class Functions {
  static String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }
}

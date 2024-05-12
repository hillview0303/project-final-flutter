import 'package:intl/intl.dart';

class DateFormatter {
  static String format(DateTime? date) {
    if (date != null) {
      return DateFormat('yyyy-MM-dd').format(date);
    } else {
      return "데이터가 없습니다.";
    }
  }
}

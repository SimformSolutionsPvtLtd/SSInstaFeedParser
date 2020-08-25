import 'package:intl/intl.dart';

class DateUtils {
  static String convertTimeStampToDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }
}

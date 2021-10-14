import 'package:intl/intl.dart';
class Util {
  static String appId = 'e919c2f08c773908e30287f273377b94';
  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat('EEE,MMM d, y').format( dateTime);
  }
}

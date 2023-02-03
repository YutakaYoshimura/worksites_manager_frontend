import '../constant/message.dart';
import 'package:intl/intl.dart';

class DatetimeFormatValidator {

  bool variable(String? value) {
    DateFormat dateFormat = DateFormat('yyyy年MM月dd日');
    DateTime dt = dateFormat.parse(value ?? '');
    String strDt = dateFormat.format(dt); 
    if (strDt != value) {
      return false;
    }
    return true;
  }

  String getMessage() => ValidateMessage.datetimeformat;
}
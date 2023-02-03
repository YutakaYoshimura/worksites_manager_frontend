import '../constant/message.dart';

class RequiredValidator {
  bool variable(String? value) {
    if (value == null) {
      return false;
    }
    if (value.trim().isEmpty) {
      return false;
    }
    return true;
  }

  String getMessage() => ValidateMessage.required;
}
import '../constant/message.dart';

class MaxLengthValidator {
  MaxLengthValidator(this.maxLength);
  final int maxLength;

  bool variable(value) => value.length <= maxLength;

  String getMessage() => maxLength.toString() + ValidateMessage.maxLength;
}
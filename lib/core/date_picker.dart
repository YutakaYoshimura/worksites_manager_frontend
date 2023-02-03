import 'package:flutter/material.dart';

class DatePicker {
  DatePicker({required this.initialDate});
  DateTime initialDate;

  Future<DateTime?> normal(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 2)
    );

    if (newDate == null) {
      return null;
    }
    return newDate;
  }
}
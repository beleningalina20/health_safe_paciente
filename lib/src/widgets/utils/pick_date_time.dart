import 'package:flutter/material.dart';

Future<DateTime?> pickDateTime(
    BuildContext context, DateTime firstDate, DateTime lastDate) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    initialDate: DateTime.now(),
    firstDate: firstDate,
    lastDate: lastDate,
  );

  return selectedDate;
}

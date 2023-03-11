import 'package:flutter/material.dart';

class DatePickerCustom {
  Future<DateTime?> seleccionarFecha(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    return selectedDate;
  }
}

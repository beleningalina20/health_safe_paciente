extension DateTimeExtensions on DateTime {
  String convertDateTimeToString() {
    return '$year-${(day < 10) ? '0$day' : day}-${(month < 10) ? '0$month' : month}';
  }
}

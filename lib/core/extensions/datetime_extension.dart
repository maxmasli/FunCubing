extension DateTimeX on DateTime {
  String getFormatDate() {
    return "${day.toString().padLeft(2, '0')}.${month.toString().padLeft(
        2, '0')}.${year.toString().padLeft(2, '0')}";
  }
}
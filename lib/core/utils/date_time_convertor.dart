class DateTimeConverter {
  static String formatFromString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return formatMonthHourMinute(dateTime);
  }
  static String formatMonthHourMinute(DateTime dateTime) {
    return "${_monthName(dateTime.month)} "
           "${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}";
  }

  static String _monthName(int month) {
    const months = [
      "Yanvar", "Fevral", "Mart", "Aprel", "May", "Iyun",
      "Iyul", "Avgust", "Sentabr", "Oktabr", "Noyabr", "Dekabr"
    ];
    return months[month - 1];
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

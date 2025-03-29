extension DateTimeFormatting on DateTime {
  // Method to format DateTime into a string based on custom format
  String formatDateTime([String format = "EEEE, dd MMMM, yyyy - HH:mm"]) {
    // Replace the placeholders with corresponding parts of the DateTime
    return format
        .replaceAllMapped(RegExp(r'yyyy'), (match) => '$year')
        .replaceAllMapped(RegExp(r'MMMM'), (match) => _getMonthName(month))
        .replaceAllMapped(
          RegExp(r'MMM'),
          (match) => _getMonthAbbreviation(month),
        )
        .replaceAllMapped(RegExp(r'MM'), (match) => _twoDigits(month))
        .replaceAllMapped(RegExp(r'dd'), (match) => _twoDigits(day))
        .replaceAllMapped(RegExp(r'HH'), (match) => _twoDigits(hour))
        .replaceAllMapped(RegExp(r'mm'), (match) => _twoDigits(minute))
        .replaceAllMapped(RegExp(r'ss'), (match) => _twoDigits(second))
        .replaceAllMapped(RegExp(r'EEEE'), (match) => _getWeekdayName(weekday))
        .replaceAllMapped(
          RegExp(r'EEE'),
          (match) => _getWeekdayAbbreviation(weekday),
        );
  }

  // Method to format Date into a string based on custom format (Date only)
  String formatDate([String format = 'yyyy-MM-dd']) {
    return format
        .replaceAllMapped(RegExp(r'yyyy'), (match) => '$year')
        .replaceAllMapped(RegExp(r'MM'), (match) => _twoDigits(month))
        .replaceAllMapped(RegExp(r'dd'), (match) => _twoDigits(day));
  }

  // Helper method to ensure two digits (for month, day, hour, minute, second)
  String _twoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }

  // Helper method to get the full name of the weekday
  String _getWeekdayName(int weekday) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return weekdays[weekday - 1];
  }

  // Helper method to get the abbreviated name of the weekday
  String _getWeekdayAbbreviation(int weekday) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[weekday - 1];
  }

  // Helper method to get the full name of the month
  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  // Helper method to get the abbreviated name of the month
  String _getMonthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}

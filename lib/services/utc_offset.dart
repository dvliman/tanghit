class UtcOffset {
  static int millisecondOffset = DateTime.now().timeZoneOffset.inMilliseconds;

  static DateTime getLocalTime(String time) {
    return DateTime.parse(time).add(Duration(milliseconds: millisecondOffset));
  }
}

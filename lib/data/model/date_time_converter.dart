class UnixDateTimeConverter {
  static int getHour(int unixTimestamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000, isUtc: true);
    return dateTime.hour;
  }
}

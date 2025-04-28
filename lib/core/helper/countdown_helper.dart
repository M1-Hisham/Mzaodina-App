class CountdownHelper {
  static Duration calculateDifference(DateTime eventTime) {
    final now = DateTime.now();
    final diff = eventTime.difference(now);
    return diff.isNegative ? Duration.zero : diff;
  }

  static Map<String, int> breakdown(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return {
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds,
    };
  }
}

abstract interface class AppLogger {
  void logBusinessEvent(
    String eventName, {
    Map<String, Object?> payload = const {},
  });

  void logError(
    Object error, {
    StackTrace? stackTrace,
    String? reason,
    bool fatal = false,
  });
}

import 'package:injectable/injectable.dart';
import 'package:talker/talker.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';

@LazySingleton(as: AppLogger)
class ConsoleAppLogger implements AppLogger {
  ConsoleAppLogger(this._talker);

  final Talker _talker;

  String _prettyPayload(Map<String, Object?> payload) {
    if (payload.isEmpty) {
      return '{}';
    }

    final buffer = StringBuffer();
    payload.forEach((key, value) {
      final raw = value == null ? 'null' : value.toString();
      final normalized = raw.replaceAll('\n', ' ').trim();
      final shortValue = normalized.length > 220
          ? '${normalized.substring(0, 220)}... [truncated]'
          : normalized;
      buffer.writeln('  - $key: $shortValue');
    });
    return buffer.toString().trimRight();
  }

  @override
  void logBusinessEvent(
    String eventName, {
    Map<String, Object?> payload = const {},
  }) {
    _talker.info(
      '[BUSINESS] $eventName\n'
      '${_prettyPayload(payload)}',
    );
  }

  @override
  void logError(
    Object error, {
    StackTrace? stackTrace,
    String? reason,
    bool fatal = false,
  }) {
    final message = '[ERROR] ${reason ?? 'Unhandled error'} | fatal: $fatal';
    if (stackTrace != null) {
      _talker.handle(
        error,
        stackTrace,
        message,
      );
      return;
    }
    _talker.error('$message | $error');
  }
}

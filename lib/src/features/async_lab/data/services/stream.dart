import 'dart:async';
import 'package:rxdart/rxdart.dart';

class StreamsModule {
  final _notificationsController = BehaviorSubject<String>();

  /// HOT STREAM
  Stream<String> notificationsStream() {
    return _notificationsController.stream;
  }

  void sendNotification(String message) {
    _notificationsController.add(message);
  }

  void sendNotificationError(Object error) {
    _notificationsController.addError(error);
  }

  Future<void> dispose() async {
    await _notificationsController.close();
  }

  /// COLD STREAM
  Stream<int> coldCounterStream() async* {
    print('Cold stream started');

    for (var i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }

    print('Cold stream completed');
  }

  /// API 1
  Stream<String> userApi() async* {
    await Future.delayed(const Duration(milliseconds: 500));
    yield 'Timur';
  }

  /// API 2
  Stream<int> balanceApi() async* {
    await Future.delayed(const Duration(milliseconds: 700));
    yield 250000;
  }

  /// API 3
  Stream<bool> insuranceApi() async* {
    await Future.delayed(const Duration(milliseconds: 300));
    yield true;
  }

  /// COMBINE LATEST
  Stream<UserDashboard> dashboardStream() {
    return Rx.combineLatest3(
      userApi(),
      balanceApi(),
      insuranceApi(),
          (
          String user,
          int balance,
          bool hasInsurance,
          ) =>
          UserDashboard(
            user: user,
            balance: balance,
            hasInsurance: hasInsurance,
          ),
    ).handleError((error, stackTrace) {
      print('Combine error: $error');
    });
  }

  /// API С ОШИБКОЙ
  Stream<String> unstableApi() async* {
    await Future.delayed(const Duration(milliseconds: 500));

    throw Exception('Temporary API error');
  }

  /// RETRY
  Stream<String> unstableApiWithRetry() {
    return Rx.retry<String>(
          () => unstableApi(),
      3,
    ).onErrorReturn('Fallback response');
  }
}

class UserDashboard {
  final String user;
  final int balance;
  final bool hasInsurance;

  UserDashboard({
    required this.user,
    required this.balance,
    required this.hasInsurance,
  });

  @override
  String toString() {
    return '''
UserDashboard(
  user: $user,
  balance: $balance,
  hasInsurance: $hasInsurance,
)
''';
  }
}
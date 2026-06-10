import 'package:injectable/injectable.dart';

@singleton
class SessionService {
  bool _isAuthorized = false;

  bool get isAuthorized => _isAuthorized;

  void signIn() {
    _isAuthorized = true;
  }

  void signOut() {
    _isAuthorized = false;
  }
}

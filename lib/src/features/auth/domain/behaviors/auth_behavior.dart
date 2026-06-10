import 'package:test_architecture/src/common/domain/models/result.dart';

abstract interface class AuthBehavior {
  Future<Result<bool>> getAuthStatus();

  Future<Result<bool>> signIn({
    required String login,
    required String password,
  });

  Future<Result<bool>> signOut();
}

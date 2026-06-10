import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/callable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/auth/domain/behaviors/auth_behavior.dart';

@injectable
class SignOutUseCase implements Callable<NoParams, bool> {
  SignOutUseCase(this._authBehavior);

  final AuthBehavior _authBehavior;

  @override
  Future<Result<bool>> call(NoParams params) {
    return _authBehavior.signOut();
  }
}

import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/callable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/auth/domain/behaviors/auth_behavior.dart';

typedef SignInParams = ({
  String login,
  String password,
});

@injectable
class SignInUseCase implements Callable<SignInParams, bool> {
  SignInUseCase(this._authBehavior);

  final AuthBehavior _authBehavior;

  @override
  Future<Result<bool>> call(SignInParams params) {
    return _authBehavior.signIn(
      login: params.login,
      password: params.password,
    );
  }
}

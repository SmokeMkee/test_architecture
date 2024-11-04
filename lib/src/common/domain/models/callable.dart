import 'package:test_architecture/src/common/domain/models/result.dart';

abstract interface class Callable<Params, Value> {
  Future<Result<Value>> call(Params params);
}

class NoParams {
  const NoParams();
}

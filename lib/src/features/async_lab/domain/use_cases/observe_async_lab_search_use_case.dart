import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart';

@injectable
class ObserveAsyncLabSearchUseCase {
  ObserveAsyncLabSearchUseCase(this._behavior);

  final AsyncLabBehavior _behavior;

  Stream<Result<List<String>>> call() => _behavior.observeDebouncedSearch();
}

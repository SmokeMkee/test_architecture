import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart';

@injectable
class DisposeAsyncLabUseCase {
  DisposeAsyncLabUseCase(this._behavior);

  final AsyncLabBehavior _behavior;

  Future<void> call() => _behavior.dispose();
}

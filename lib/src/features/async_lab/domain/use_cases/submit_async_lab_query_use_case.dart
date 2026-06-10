import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart';

@injectable
class SubmitAsyncLabQueryUseCase {
  SubmitAsyncLabQueryUseCase(this._behavior);

  final AsyncLabBehavior _behavior;

  void call(String query) => _behavior.submitSearchQuery(query);
}

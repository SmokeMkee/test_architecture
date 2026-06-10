import 'package:test_architecture/src/common/domain/models/result.dart';

abstract interface class AsyncLabBehavior {
  Stream<Result<List<String>>> observeDebouncedSearch();

  void submitSearchQuery(String query);

  Future<void> dispose();
}

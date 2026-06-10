import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/async_lab/data/services/async_lab_service.dart';

void main() {
  test('debounce emits only latest query result', () async {
    final service = AsyncLabService();
    final emitted = <Result<List<String>>>[];
    final subscription = service.observeDebouncedSearch().listen(emitted.add);

    service
      ..submitSearchQuery('d')
      ..submitSearchQuery('da')
      ..submitSearchQuery('dart');

    await Future<void>.delayed(const Duration(milliseconds: 450));
    await subscription.cancel();
    await service.dispose();

    expect(emitted.length, 1);
    expect((emitted.single as SuccessResult<List<String>>).value.first, 'Result 1 for "dart"');
  });

  test('debounce reports error for "error" query', () async {
    final service = AsyncLabService();
    final emitted = <Result<List<String>>>[];
    final subscription = service.observeDebouncedSearch().listen(emitted.add);

    service.submitSearchQuery('error');

    await Future<void>.delayed(const Duration(milliseconds: 450));
    await subscription.cancel();
    await service.dispose();

    expect(emitted.length, 1);
    expect(emitted.single, isA<ErrorResult<List<String>>>());
  });
}

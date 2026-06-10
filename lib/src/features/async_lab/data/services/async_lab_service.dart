import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/failures/failure.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart';

@lazySingleton
class AsyncLabService implements AsyncLabBehavior {
  AsyncLabService()
      : _queryController = StreamController<String>(),
        _searchResultController = StreamController<Result<List<String>>>.broadcast() {
    _debounceSubscription = _queryController.stream.listen((query) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 350), () async {
        if (query.trim().isEmpty) return;
        try {
          await Future<void>.delayed(const Duration(milliseconds: 60));
          if (query == 'error') throw Exception('demo failure');
          final results =
              List<String>.generate(1, (index) => 'Result ${index + 1} for "$query"');
          _searchResultController.add(SuccessResult<List<String>>(results));
        } catch (_) {
          _searchResultController.add(
            ErrorResult<List<String>>(
              OtherFailure(message: 'Search failed for "$query"'),
            ),
          );
        }
      });
    });
  }

  final StreamController<String> _queryController;
  final StreamController<Result<List<String>>> _searchResultController;
  late final StreamSubscription<String> _debounceSubscription;
  Timer? _debounceTimer;
  bool _isDisposed = false;

  @override
  Stream<Result<List<String>>> observeDebouncedSearch() => _searchResultController.stream;

  @override
  void submitSearchQuery(String query) {
    if (_isDisposed) return;
    _queryController.add(query);
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) return;
    _isDisposed = true;
    _debounceTimer?.cancel();
    await _debounceSubscription.cancel();
    await _queryController.close();
    await _searchResultController.close();
  }
}

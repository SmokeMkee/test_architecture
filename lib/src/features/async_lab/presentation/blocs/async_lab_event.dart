import 'package:test_architecture/src/common/domain/models/result.dart';

sealed class AsyncLabEvent {}

class AsyncLabStarted extends AsyncLabEvent {}

class AsyncLabSearchQueryChanged extends AsyncLabEvent {
  AsyncLabSearchQueryChanged(this.query);

  final String query;
}

class AsyncLabSearchResultReceived extends AsyncLabEvent {
  AsyncLabSearchResultReceived(this.result);

  final Result<List<String>> result;
}

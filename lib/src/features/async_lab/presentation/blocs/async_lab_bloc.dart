import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/async_lab/domain/models/async_lab_state.dart';
import 'package:test_architecture/src/features/async_lab/domain/use_cases/dispose_async_lab_use_case.dart';
import 'package:test_architecture/src/features/async_lab/domain/use_cases/observe_async_lab_search_use_case.dart';
import 'package:test_architecture/src/features/async_lab/domain/use_cases/submit_async_lab_query_use_case.dart';
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_event.dart';

@injectable
class AsyncLabBloc extends Bloc<AsyncLabEvent, AsyncLabState> {
  AsyncLabBloc(
    this._observeSearchUseCase,
    this._submitQueryUseCase,
    this._disposeUseCase,
  ) : super(const AsyncLabState()) {
    on<AsyncLabStarted>(_onStarted);
    on<AsyncLabSearchQueryChanged>(_onSearchQueryChanged);
    on<AsyncLabSearchResultReceived>(_onSearchResultReceived);
  }

  final ObserveAsyncLabSearchUseCase _observeSearchUseCase;
  final SubmitAsyncLabQueryUseCase _submitQueryUseCase;
  final DisposeAsyncLabUseCase _disposeUseCase;
  StreamSubscription<Result<List<String>>>? _searchSubscription;

  Future<void> _onStarted(
    AsyncLabStarted event,
    Emitter<AsyncLabState> emit,
  ) async {
    _searchSubscription ??= _observeSearchUseCase().listen((result) {
      add(AsyncLabSearchResultReceived(result));
    });
  }

  Future<void> _onSearchQueryChanged(
    AsyncLabSearchQueryChanged event,
    Emitter<AsyncLabState> emit,
  ) async {
    _submitQueryUseCase(event.query);
    emit(
      state.copyWith(
        searchQuery: event.query,
      ),
    );
  }

  Future<void> _onSearchResultReceived(
    AsyncLabSearchResultReceived event,
    Emitter<AsyncLabState> emit,
  ) async {
    final value = event.result.value;
    final failure = event.result.failure;
    emit(
      state.copyWith(
        searchResults: value ?? const [],
        searchErrorMessage: failure?.message,
        clearSearchErrorMessage: value != null,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _searchSubscription?.cancel();
    await _disposeUseCase();
    return super.close();
  }
}

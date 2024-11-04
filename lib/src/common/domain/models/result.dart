import 'package:test_architecture/src/common/domain/failures/failure.dart';

sealed class Result<Value> {}

class SuccessResult<Value> extends Result<Value> {
  final Value value;

  SuccessResult(this.value);
}

class ErrorResult<Value> extends Result<Value> {
  final Failure failure;

  ErrorResult(this.failure);
}

extension ResultX<Value> on Result<Value> {
  Value? get value => switch (this) {
        SuccessResult(value: final value) => value,
        ErrorResult() => null,
      };

  Failure? get failure => switch (this) {
        SuccessResult() => null,
        ErrorResult(failure: final failure) => failure,
      };

  Failure get failureOrDefault => switch (this) {
        SuccessResult() => UnexpectedFailure(),
        ErrorResult(failure: final failure) => failure,
      };
}

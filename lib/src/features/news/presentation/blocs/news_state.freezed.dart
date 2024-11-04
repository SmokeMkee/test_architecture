// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsState {
  NewsDataState get newsState => throw _privateConstructorUsedError;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call({NewsDataState newsState});

  $NewsDataStateCopyWith<$Res> get newsState;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = null,
  }) {
    return _then(_value.copyWith(
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsDataState,
    ) as $Val);
  }

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NewsDataStateCopyWith<$Res> get newsState {
    return $NewsDataStateCopyWith<$Res>(_value.newsState, (value) {
      return _then(_value.copyWith(newsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewsDataState newsState});

  @override
  $NewsDataStateCopyWith<$Res> get newsState;
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsState = null,
  }) {
    return _then(_$NewsStateImpl(
      newsState: null == newsState
          ? _value.newsState
          : newsState // ignore: cast_nullable_to_non_nullable
              as NewsDataState,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl implements _NewsState {
  _$NewsStateImpl({this.newsState = const NewsDataInitial()});

  @override
  @JsonKey()
  final NewsDataState newsState;

  @override
  String toString() {
    return 'NewsState(newsState: $newsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.newsState, newsState) ||
                other.newsState == newsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newsState);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  factory _NewsState({final NewsDataState newsState}) = _$NewsStateImpl;

  @override
  NewsDataState get newsState;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewsDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<News> news) successLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<News> news)? successLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? failure,
    TResult Function(List<News> news)? successLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsDataInitial value) initial,
    required TResult Function(NewsDataLoading value) loading,
    required TResult Function(NewsDataFailure value) failure,
    required TResult Function(NewsDataSuccessLoaded value) successLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsDataInitial value)? initial,
    TResult? Function(NewsDataLoading value)? loading,
    TResult? Function(NewsDataFailure value)? failure,
    TResult? Function(NewsDataSuccessLoaded value)? successLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsDataInitial value)? initial,
    TResult Function(NewsDataLoading value)? loading,
    TResult Function(NewsDataFailure value)? failure,
    TResult Function(NewsDataSuccessLoaded value)? successLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsDataStateCopyWith<$Res> {
  factory $NewsDataStateCopyWith(
          NewsDataState value, $Res Function(NewsDataState) then) =
      _$NewsDataStateCopyWithImpl<$Res, NewsDataState>;
}

/// @nodoc
class _$NewsDataStateCopyWithImpl<$Res, $Val extends NewsDataState>
    implements $NewsDataStateCopyWith<$Res> {
  _$NewsDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NewsDataInitialImplCopyWith<$Res> {
  factory _$$NewsDataInitialImplCopyWith(_$NewsDataInitialImpl value,
          $Res Function(_$NewsDataInitialImpl) then) =
      __$$NewsDataInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsDataInitialImplCopyWithImpl<$Res>
    extends _$NewsDataStateCopyWithImpl<$Res, _$NewsDataInitialImpl>
    implements _$$NewsDataInitialImplCopyWith<$Res> {
  __$$NewsDataInitialImplCopyWithImpl(
      _$NewsDataInitialImpl _value, $Res Function(_$NewsDataInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NewsDataInitialImpl implements NewsDataInitial {
  const _$NewsDataInitialImpl();

  @override
  String toString() {
    return 'NewsDataState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewsDataInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<News> news) successLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<News> news)? successLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? failure,
    TResult Function(List<News> news)? successLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsDataInitial value) initial,
    required TResult Function(NewsDataLoading value) loading,
    required TResult Function(NewsDataFailure value) failure,
    required TResult Function(NewsDataSuccessLoaded value) successLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsDataInitial value)? initial,
    TResult? Function(NewsDataLoading value)? loading,
    TResult? Function(NewsDataFailure value)? failure,
    TResult? Function(NewsDataSuccessLoaded value)? successLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsDataInitial value)? initial,
    TResult Function(NewsDataLoading value)? loading,
    TResult Function(NewsDataFailure value)? failure,
    TResult Function(NewsDataSuccessLoaded value)? successLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NewsDataInitial implements NewsDataState {
  const factory NewsDataInitial() = _$NewsDataInitialImpl;
}

/// @nodoc
abstract class _$$NewsDataLoadingImplCopyWith<$Res> {
  factory _$$NewsDataLoadingImplCopyWith(_$NewsDataLoadingImpl value,
          $Res Function(_$NewsDataLoadingImpl) then) =
      __$$NewsDataLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewsDataLoadingImplCopyWithImpl<$Res>
    extends _$NewsDataStateCopyWithImpl<$Res, _$NewsDataLoadingImpl>
    implements _$$NewsDataLoadingImplCopyWith<$Res> {
  __$$NewsDataLoadingImplCopyWithImpl(
      _$NewsDataLoadingImpl _value, $Res Function(_$NewsDataLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NewsDataLoadingImpl implements NewsDataLoading {
  const _$NewsDataLoadingImpl();

  @override
  String toString() {
    return 'NewsDataState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewsDataLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<News> news) successLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<News> news)? successLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? failure,
    TResult Function(List<News> news)? successLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsDataInitial value) initial,
    required TResult Function(NewsDataLoading value) loading,
    required TResult Function(NewsDataFailure value) failure,
    required TResult Function(NewsDataSuccessLoaded value) successLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsDataInitial value)? initial,
    TResult? Function(NewsDataLoading value)? loading,
    TResult? Function(NewsDataFailure value)? failure,
    TResult? Function(NewsDataSuccessLoaded value)? successLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsDataInitial value)? initial,
    TResult Function(NewsDataLoading value)? loading,
    TResult Function(NewsDataFailure value)? failure,
    TResult Function(NewsDataSuccessLoaded value)? successLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewsDataLoading implements NewsDataState {
  const factory NewsDataLoading() = _$NewsDataLoadingImpl;
}

/// @nodoc
abstract class _$$NewsDataFailureImplCopyWith<$Res> {
  factory _$$NewsDataFailureImplCopyWith(_$NewsDataFailureImpl value,
          $Res Function(_$NewsDataFailureImpl) then) =
      __$$NewsDataFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$NewsDataFailureImplCopyWithImpl<$Res>
    extends _$NewsDataStateCopyWithImpl<$Res, _$NewsDataFailureImpl>
    implements _$$NewsDataFailureImplCopyWith<$Res> {
  __$$NewsDataFailureImplCopyWithImpl(
      _$NewsDataFailureImpl _value, $Res Function(_$NewsDataFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$NewsDataFailureImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$NewsDataFailureImpl implements NewsDataFailure {
  const _$NewsDataFailureImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'NewsDataState.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDataFailureImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDataFailureImplCopyWith<_$NewsDataFailureImpl> get copyWith =>
      __$$NewsDataFailureImplCopyWithImpl<_$NewsDataFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<News> news) successLoaded,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<News> news)? successLoaded,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? failure,
    TResult Function(List<News> news)? successLoaded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsDataInitial value) initial,
    required TResult Function(NewsDataLoading value) loading,
    required TResult Function(NewsDataFailure value) failure,
    required TResult Function(NewsDataSuccessLoaded value) successLoaded,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsDataInitial value)? initial,
    TResult? Function(NewsDataLoading value)? loading,
    TResult? Function(NewsDataFailure value)? failure,
    TResult? Function(NewsDataSuccessLoaded value)? successLoaded,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsDataInitial value)? initial,
    TResult Function(NewsDataLoading value)? loading,
    TResult Function(NewsDataFailure value)? failure,
    TResult Function(NewsDataSuccessLoaded value)? successLoaded,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class NewsDataFailure implements NewsDataState {
  const factory NewsDataFailure(final Failure failure) = _$NewsDataFailureImpl;

  Failure get failure;

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsDataFailureImplCopyWith<_$NewsDataFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewsDataSuccessLoadedImplCopyWith<$Res> {
  factory _$$NewsDataSuccessLoadedImplCopyWith(
          _$NewsDataSuccessLoadedImpl value,
          $Res Function(_$NewsDataSuccessLoadedImpl) then) =
      __$$NewsDataSuccessLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<News> news});
}

/// @nodoc
class __$$NewsDataSuccessLoadedImplCopyWithImpl<$Res>
    extends _$NewsDataStateCopyWithImpl<$Res, _$NewsDataSuccessLoadedImpl>
    implements _$$NewsDataSuccessLoadedImplCopyWith<$Res> {
  __$$NewsDataSuccessLoadedImplCopyWithImpl(_$NewsDataSuccessLoadedImpl _value,
      $Res Function(_$NewsDataSuccessLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$NewsDataSuccessLoadedImpl(
      null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
    ));
  }
}

/// @nodoc

class _$NewsDataSuccessLoadedImpl implements NewsDataSuccessLoaded {
  const _$NewsDataSuccessLoadedImpl(final List<News> news) : _news = news;

  final List<News> _news;
  @override
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'NewsDataState.successLoaded(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsDataSuccessLoadedImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsDataSuccessLoadedImplCopyWith<_$NewsDataSuccessLoadedImpl>
      get copyWith => __$$NewsDataSuccessLoadedImplCopyWithImpl<
          _$NewsDataSuccessLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure failure) failure,
    required TResult Function(List<News> news) successLoaded,
  }) {
    return successLoaded(news);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure failure)? failure,
    TResult? Function(List<News> news)? successLoaded,
  }) {
    return successLoaded?.call(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure failure)? failure,
    TResult Function(List<News> news)? successLoaded,
    required TResult orElse(),
  }) {
    if (successLoaded != null) {
      return successLoaded(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsDataInitial value) initial,
    required TResult Function(NewsDataLoading value) loading,
    required TResult Function(NewsDataFailure value) failure,
    required TResult Function(NewsDataSuccessLoaded value) successLoaded,
  }) {
    return successLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewsDataInitial value)? initial,
    TResult? Function(NewsDataLoading value)? loading,
    TResult? Function(NewsDataFailure value)? failure,
    TResult? Function(NewsDataSuccessLoaded value)? successLoaded,
  }) {
    return successLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsDataInitial value)? initial,
    TResult Function(NewsDataLoading value)? loading,
    TResult Function(NewsDataFailure value)? failure,
    TResult Function(NewsDataSuccessLoaded value)? successLoaded,
    required TResult orElse(),
  }) {
    if (successLoaded != null) {
      return successLoaded(this);
    }
    return orElse();
  }
}

abstract class NewsDataSuccessLoaded implements NewsDataState {
  const factory NewsDataSuccessLoaded(final List<News> news) =
      _$NewsDataSuccessLoadedImpl;

  List<News> get news;

  /// Create a copy of NewsDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsDataSuccessLoadedImplCopyWith<_$NewsDataSuccessLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

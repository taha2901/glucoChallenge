// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() paymentLoading,
    required TResult Function() paymentSuccess,
    required TResult Function(String errorMessage) paymentError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? paymentLoading,
    TResult? Function()? paymentSuccess,
    TResult? Function(String errorMessage)? paymentError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? paymentLoading,
    TResult Function()? paymentSuccess,
    TResult Function(String errorMessage)? paymentError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentError value) paymentError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentError value)? paymentError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentError value)? paymentError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() paymentLoading,
    required TResult Function() paymentSuccess,
    required TResult Function(String errorMessage) paymentError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? paymentLoading,
    TResult? Function()? paymentSuccess,
    TResult? Function(String errorMessage)? paymentError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? paymentLoading,
    TResult Function()? paymentSuccess,
    TResult Function(String errorMessage)? paymentError,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentError value) paymentError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentError value)? paymentError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentError value)? paymentError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PaymentLoadingImplCopyWith<$Res> {
  factory _$$PaymentLoadingImplCopyWith(_$PaymentLoadingImpl value,
          $Res Function(_$PaymentLoadingImpl) then) =
      __$$PaymentLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentLoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentLoadingImpl>
    implements _$$PaymentLoadingImplCopyWith<$Res> {
  __$$PaymentLoadingImplCopyWithImpl(
      _$PaymentLoadingImpl _value, $Res Function(_$PaymentLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentLoadingImpl implements PaymentLoading {
  const _$PaymentLoadingImpl();

  @override
  String toString() {
    return 'PaymentState.paymentLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() paymentLoading,
    required TResult Function() paymentSuccess,
    required TResult Function(String errorMessage) paymentError,
  }) {
    return paymentLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? paymentLoading,
    TResult? Function()? paymentSuccess,
    TResult? Function(String errorMessage)? paymentError,
  }) {
    return paymentLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? paymentLoading,
    TResult Function()? paymentSuccess,
    TResult Function(String errorMessage)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentLoading != null) {
      return paymentLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentError value) paymentError,
  }) {
    return paymentLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentError value)? paymentError,
  }) {
    return paymentLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentError value)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentLoading != null) {
      return paymentLoading(this);
    }
    return orElse();
  }
}

abstract class PaymentLoading implements PaymentState {
  const factory PaymentLoading() = _$PaymentLoadingImpl;
}

/// @nodoc
abstract class _$$PaymentSuccessImplCopyWith<$Res> {
  factory _$$PaymentSuccessImplCopyWith(_$PaymentSuccessImpl value,
          $Res Function(_$PaymentSuccessImpl) then) =
      __$$PaymentSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentSuccessImpl>
    implements _$$PaymentSuccessImplCopyWith<$Res> {
  __$$PaymentSuccessImplCopyWithImpl(
      _$PaymentSuccessImpl _value, $Res Function(_$PaymentSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentSuccessImpl implements PaymentSuccess {
  const _$PaymentSuccessImpl();

  @override
  String toString() {
    return 'PaymentState.paymentSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() paymentLoading,
    required TResult Function() paymentSuccess,
    required TResult Function(String errorMessage) paymentError,
  }) {
    return paymentSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? paymentLoading,
    TResult? Function()? paymentSuccess,
    TResult? Function(String errorMessage)? paymentError,
  }) {
    return paymentSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? paymentLoading,
    TResult Function()? paymentSuccess,
    TResult Function(String errorMessage)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentSuccess != null) {
      return paymentSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentError value) paymentError,
  }) {
    return paymentSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentError value)? paymentError,
  }) {
    return paymentSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentError value)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentSuccess != null) {
      return paymentSuccess(this);
    }
    return orElse();
  }
}

abstract class PaymentSuccess implements PaymentState {
  const factory PaymentSuccess() = _$PaymentSuccessImpl;
}

/// @nodoc
abstract class _$$PaymentErrorImplCopyWith<$Res> {
  factory _$$PaymentErrorImplCopyWith(
          _$PaymentErrorImpl value, $Res Function(_$PaymentErrorImpl) then) =
      __$$PaymentErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$PaymentErrorImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentErrorImpl>
    implements _$$PaymentErrorImplCopyWith<$Res> {
  __$$PaymentErrorImplCopyWithImpl(
      _$PaymentErrorImpl _value, $Res Function(_$PaymentErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$PaymentErrorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentErrorImpl implements PaymentError {
  const _$PaymentErrorImpl({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'PaymentState.paymentError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentErrorImplCopyWith<_$PaymentErrorImpl> get copyWith =>
      __$$PaymentErrorImplCopyWithImpl<_$PaymentErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() paymentLoading,
    required TResult Function() paymentSuccess,
    required TResult Function(String errorMessage) paymentError,
  }) {
    return paymentError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? paymentLoading,
    TResult? Function()? paymentSuccess,
    TResult? Function(String errorMessage)? paymentError,
  }) {
    return paymentError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? paymentLoading,
    TResult Function()? paymentSuccess,
    TResult Function(String errorMessage)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentError != null) {
      return paymentError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(PaymentError value) paymentError,
  }) {
    return paymentError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(PaymentError value)? paymentError,
  }) {
    return paymentError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(PaymentError value)? paymentError,
    required TResult orElse(),
  }) {
    if (paymentError != null) {
      return paymentError(this);
    }
    return orElse();
  }
}

abstract class PaymentError implements PaymentState {
  const factory PaymentError({required final String errorMessage}) =
      _$PaymentErrorImpl;

  String get errorMessage;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentErrorImplCopyWith<_$PaymentErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

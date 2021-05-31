// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  AuthLoadingState loading() {
    return const AuthLoadingState();
  }

  AuthSignInState signIn({required bool hasError, required bool succeed}) {
    return AuthSignInState(
      hasError: hasError,
      succeed: succeed,
    );
  }

  AuthSignUpState signUp({required bool succeed}) {
    return AuthSignUpState(
      succeed: succeed,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(bool hasError, bool succeed) signIn,
    required TResult Function(bool succeed) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(bool hasError, bool succeed)? signIn,
    TResult Function(bool succeed)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthSignInState value) signIn,
    required TResult Function(AuthSignUpState value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthSignInState value)? signIn,
    TResult Function(AuthSignUpState value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthLoadingStateCopyWith<$Res> {
  factory $AuthLoadingStateCopyWith(
          AuthLoadingState value, $Res Function(AuthLoadingState) then) =
      _$AuthLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthLoadingStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthLoadingStateCopyWith<$Res> {
  _$AuthLoadingStateCopyWithImpl(
      AuthLoadingState _value, $Res Function(AuthLoadingState) _then)
      : super(_value, (v) => _then(v as AuthLoadingState));

  @override
  AuthLoadingState get _value => super._value as AuthLoadingState;
}

/// @nodoc

class _$AuthLoadingState implements AuthLoadingState {
  const _$AuthLoadingState();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(bool hasError, bool succeed) signIn,
    required TResult Function(bool succeed) signUp,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(bool hasError, bool succeed)? signIn,
    TResult Function(bool succeed)? signUp,
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
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthSignInState value) signIn,
    required TResult Function(AuthSignUpState value) signUp,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthSignInState value)? signIn,
    TResult Function(AuthSignUpState value)? signUp,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoadingState implements AuthState {
  const factory AuthLoadingState() = _$AuthLoadingState;
}

/// @nodoc
abstract class $AuthSignInStateCopyWith<$Res> {
  factory $AuthSignInStateCopyWith(
          AuthSignInState value, $Res Function(AuthSignInState) then) =
      _$AuthSignInStateCopyWithImpl<$Res>;
  $Res call({bool hasError, bool succeed});
}

/// @nodoc
class _$AuthSignInStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthSignInStateCopyWith<$Res> {
  _$AuthSignInStateCopyWithImpl(
      AuthSignInState _value, $Res Function(AuthSignInState) _then)
      : super(_value, (v) => _then(v as AuthSignInState));

  @override
  AuthSignInState get _value => super._value as AuthSignInState;

  @override
  $Res call({
    Object? hasError = freezed,
    Object? succeed = freezed,
  }) {
    return _then(AuthSignInState(
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      succeed: succeed == freezed
          ? _value.succeed
          : succeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthSignInState implements AuthSignInState {
  const _$AuthSignInState({required this.hasError, required this.succeed});

  @override
  final bool hasError;
  @override
  final bool succeed;

  @override
  String toString() {
    return 'AuthState.signIn(hasError: $hasError, succeed: $succeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthSignInState &&
            (identical(other.hasError, hasError) ||
                const DeepCollectionEquality()
                    .equals(other.hasError, hasError)) &&
            (identical(other.succeed, succeed) ||
                const DeepCollectionEquality().equals(other.succeed, succeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasError) ^
      const DeepCollectionEquality().hash(succeed);

  @JsonKey(ignore: true)
  @override
  $AuthSignInStateCopyWith<AuthSignInState> get copyWith =>
      _$AuthSignInStateCopyWithImpl<AuthSignInState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(bool hasError, bool succeed) signIn,
    required TResult Function(bool succeed) signUp,
  }) {
    return signIn(hasError, succeed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(bool hasError, bool succeed)? signIn,
    TResult Function(bool succeed)? signUp,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(hasError, succeed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthSignInState value) signIn,
    required TResult Function(AuthSignUpState value) signUp,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthSignInState value)? signIn,
    TResult Function(AuthSignUpState value)? signUp,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class AuthSignInState implements AuthState {
  const factory AuthSignInState(
      {required bool hasError, required bool succeed}) = _$AuthSignInState;

  bool get hasError => throw _privateConstructorUsedError;
  bool get succeed => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSignInStateCopyWith<AuthSignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSignUpStateCopyWith<$Res> {
  factory $AuthSignUpStateCopyWith(
          AuthSignUpState value, $Res Function(AuthSignUpState) then) =
      _$AuthSignUpStateCopyWithImpl<$Res>;
  $Res call({bool succeed});
}

/// @nodoc
class _$AuthSignUpStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthSignUpStateCopyWith<$Res> {
  _$AuthSignUpStateCopyWithImpl(
      AuthSignUpState _value, $Res Function(AuthSignUpState) _then)
      : super(_value, (v) => _then(v as AuthSignUpState));

  @override
  AuthSignUpState get _value => super._value as AuthSignUpState;

  @override
  $Res call({
    Object? succeed = freezed,
  }) {
    return _then(AuthSignUpState(
      succeed: succeed == freezed
          ? _value.succeed
          : succeed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthSignUpState implements AuthSignUpState {
  const _$AuthSignUpState({required this.succeed});

  @override
  final bool succeed;

  @override
  String toString() {
    return 'AuthState.signUp(succeed: $succeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthSignUpState &&
            (identical(other.succeed, succeed) ||
                const DeepCollectionEquality().equals(other.succeed, succeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(succeed);

  @JsonKey(ignore: true)
  @override
  $AuthSignUpStateCopyWith<AuthSignUpState> get copyWith =>
      _$AuthSignUpStateCopyWithImpl<AuthSignUpState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(bool hasError, bool succeed) signIn,
    required TResult Function(bool succeed) signUp,
  }) {
    return signUp(succeed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(bool hasError, bool succeed)? signIn,
    TResult Function(bool succeed)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(succeed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthLoadingState value) loading,
    required TResult Function(AuthSignInState value) signIn,
    required TResult Function(AuthSignUpState value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthLoadingState value)? loading,
    TResult Function(AuthSignInState value)? signIn,
    TResult Function(AuthSignUpState value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class AuthSignUpState implements AuthState {
  const factory AuthSignUpState({required bool succeed}) = _$AuthSignUpState;

  bool get succeed => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSignUpStateCopyWith<AuthSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

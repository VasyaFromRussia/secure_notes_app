// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotesStateTearOff {
  const _$NotesStateTearOff();

  NotesLoadingState loading() {
    return const NotesLoadingState();
  }

  NotesDataState data({required List<NoteMetaModel> data}) {
    return NotesDataState(
      data: data,
    );
  }
}

/// @nodoc
const $NotesState = _$NotesStateTearOff();

/// @nodoc
mixin _$NotesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NoteMetaModel> data) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NoteMetaModel> data)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotesLoadingState value) loading,
    required TResult Function(NotesDataState value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotesLoadingState value)? loading,
    TResult Function(NotesDataState value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res> implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  final NotesState _value;
  // ignore: unused_field
  final $Res Function(NotesState) _then;
}

/// @nodoc
abstract class $NotesLoadingStateCopyWith<$Res> {
  factory $NotesLoadingStateCopyWith(
          NotesLoadingState value, $Res Function(NotesLoadingState) then) =
      _$NotesLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotesLoadingStateCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res>
    implements $NotesLoadingStateCopyWith<$Res> {
  _$NotesLoadingStateCopyWithImpl(
      NotesLoadingState _value, $Res Function(NotesLoadingState) _then)
      : super(_value, (v) => _then(v as NotesLoadingState));

  @override
  NotesLoadingState get _value => super._value as NotesLoadingState;
}

/// @nodoc

class _$NotesLoadingState implements NotesLoadingState {
  const _$NotesLoadingState();

  @override
  String toString() {
    return 'NotesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotesLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NoteMetaModel> data) data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NoteMetaModel> data)? data,
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
    required TResult Function(NotesLoadingState value) loading,
    required TResult Function(NotesDataState value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotesLoadingState value)? loading,
    TResult Function(NotesDataState value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NotesLoadingState implements NotesState {
  const factory NotesLoadingState() = _$NotesLoadingState;
}

/// @nodoc
abstract class $NotesDataStateCopyWith<$Res> {
  factory $NotesDataStateCopyWith(
          NotesDataState value, $Res Function(NotesDataState) then) =
      _$NotesDataStateCopyWithImpl<$Res>;
  $Res call({List<NoteMetaModel> data});
}

/// @nodoc
class _$NotesDataStateCopyWithImpl<$Res> extends _$NotesStateCopyWithImpl<$Res>
    implements $NotesDataStateCopyWith<$Res> {
  _$NotesDataStateCopyWithImpl(
      NotesDataState _value, $Res Function(NotesDataState) _then)
      : super(_value, (v) => _then(v as NotesDataState));

  @override
  NotesDataState get _value => super._value as NotesDataState;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(NotesDataState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NoteMetaModel>,
    ));
  }
}

/// @nodoc

class _$NotesDataState implements NotesDataState {
  const _$NotesDataState({required this.data});

  @override
  final List<NoteMetaModel> data;

  @override
  String toString() {
    return 'NotesState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotesDataState &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $NotesDataStateCopyWith<NotesDataState> get copyWith =>
      _$NotesDataStateCopyWithImpl<NotesDataState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NoteMetaModel> data) data,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NoteMetaModel> data)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotesLoadingState value) loading,
    required TResult Function(NotesDataState value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotesLoadingState value)? loading,
    TResult Function(NotesDataState value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class NotesDataState implements NotesState {
  const factory NotesDataState({required List<NoteMetaModel> data}) =
      _$NotesDataState;

  List<NoteMetaModel> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesDataStateCopyWith<NotesDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

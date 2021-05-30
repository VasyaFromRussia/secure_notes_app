// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditorStateTearOff {
  const _$EditorStateTearOff();

  EditorLoadingState loading() {
    return const EditorLoadingState();
  }

  EditorReadingState reading(NoteModel note) {
    return EditorReadingState(
      note,
    );
  }

  EditorEditingState editing(NoteModel note) {
    return EditorEditingState(
      note,
    );
  }
}

/// @nodoc
const $EditorState = _$EditorStateTearOff();

/// @nodoc
mixin _$EditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(NoteModel note) reading,
    required TResult Function(NoteModel note) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(NoteModel note)? reading,
    TResult Function(NoteModel note)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorReadingState value) reading,
    required TResult Function(EditorEditingState value) editing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorReadingState value)? reading,
    TResult Function(EditorEditingState value)? editing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorStateCopyWith<$Res> {
  factory $EditorStateCopyWith(
          EditorState value, $Res Function(EditorState) then) =
      _$EditorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditorStateCopyWithImpl<$Res> implements $EditorStateCopyWith<$Res> {
  _$EditorStateCopyWithImpl(this._value, this._then);

  final EditorState _value;
  // ignore: unused_field
  final $Res Function(EditorState) _then;
}

/// @nodoc
abstract class $EditorLoadingStateCopyWith<$Res> {
  factory $EditorLoadingStateCopyWith(
          EditorLoadingState value, $Res Function(EditorLoadingState) then) =
      _$EditorLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditorLoadingStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res>
    implements $EditorLoadingStateCopyWith<$Res> {
  _$EditorLoadingStateCopyWithImpl(
      EditorLoadingState _value, $Res Function(EditorLoadingState) _then)
      : super(_value, (v) => _then(v as EditorLoadingState));

  @override
  EditorLoadingState get _value => super._value as EditorLoadingState;
}

/// @nodoc

class _$EditorLoadingState implements EditorLoadingState {
  const _$EditorLoadingState();

  @override
  String toString() {
    return 'EditorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditorLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(NoteModel note) reading,
    required TResult Function(NoteModel note) editing,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(NoteModel note)? reading,
    TResult Function(NoteModel note)? editing,
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
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorReadingState value) reading,
    required TResult Function(EditorEditingState value) editing,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorReadingState value)? reading,
    TResult Function(EditorEditingState value)? editing,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditorLoadingState implements EditorState {
  const factory EditorLoadingState() = _$EditorLoadingState;
}

/// @nodoc
abstract class $EditorReadingStateCopyWith<$Res> {
  factory $EditorReadingStateCopyWith(
          EditorReadingState value, $Res Function(EditorReadingState) then) =
      _$EditorReadingStateCopyWithImpl<$Res>;
  $Res call({NoteModel note});

  $NoteModelCopyWith<$Res> get note;
}

/// @nodoc
class _$EditorReadingStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res>
    implements $EditorReadingStateCopyWith<$Res> {
  _$EditorReadingStateCopyWithImpl(
      EditorReadingState _value, $Res Function(EditorReadingState) _then)
      : super(_value, (v) => _then(v as EditorReadingState));

  @override
  EditorReadingState get _value => super._value as EditorReadingState;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(EditorReadingState(
      note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }

  @override
  $NoteModelCopyWith<$Res> get note {
    return $NoteModelCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$EditorReadingState implements EditorReadingState {
  const _$EditorReadingState(this.note);

  @override
  final NoteModel note;

  @override
  String toString() {
    return 'EditorState.reading(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditorReadingState &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  $EditorReadingStateCopyWith<EditorReadingState> get copyWith =>
      _$EditorReadingStateCopyWithImpl<EditorReadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(NoteModel note) reading,
    required TResult Function(NoteModel note) editing,
  }) {
    return reading(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(NoteModel note)? reading,
    TResult Function(NoteModel note)? editing,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorReadingState value) reading,
    required TResult Function(EditorEditingState value) editing,
  }) {
    return reading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorReadingState value)? reading,
    TResult Function(EditorEditingState value)? editing,
    required TResult orElse(),
  }) {
    if (reading != null) {
      return reading(this);
    }
    return orElse();
  }
}

abstract class EditorReadingState implements EditorState {
  const factory EditorReadingState(NoteModel note) = _$EditorReadingState;

  NoteModel get note => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditorReadingStateCopyWith<EditorReadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorEditingStateCopyWith<$Res> {
  factory $EditorEditingStateCopyWith(
          EditorEditingState value, $Res Function(EditorEditingState) then) =
      _$EditorEditingStateCopyWithImpl<$Res>;
  $Res call({NoteModel note});

  $NoteModelCopyWith<$Res> get note;
}

/// @nodoc
class _$EditorEditingStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res>
    implements $EditorEditingStateCopyWith<$Res> {
  _$EditorEditingStateCopyWithImpl(
      EditorEditingState _value, $Res Function(EditorEditingState) _then)
      : super(_value, (v) => _then(v as EditorEditingState));

  @override
  EditorEditingState get _value => super._value as EditorEditingState;

  @override
  $Res call({
    Object? note = freezed,
  }) {
    return _then(EditorEditingState(
      note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as NoteModel,
    ));
  }

  @override
  $NoteModelCopyWith<$Res> get note {
    return $NoteModelCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$EditorEditingState implements EditorEditingState {
  const _$EditorEditingState(this.note);

  @override
  final NoteModel note;

  @override
  String toString() {
    return 'EditorState.editing(note: $note)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditorEditingState &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(note);

  @JsonKey(ignore: true)
  @override
  $EditorEditingStateCopyWith<EditorEditingState> get copyWith =>
      _$EditorEditingStateCopyWithImpl<EditorEditingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(NoteModel note) reading,
    required TResult Function(NoteModel note) editing,
  }) {
    return editing(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(NoteModel note)? reading,
    TResult Function(NoteModel note)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorReadingState value) reading,
    required TResult Function(EditorEditingState value) editing,
  }) {
    return editing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorReadingState value)? reading,
    TResult Function(EditorEditingState value)? editing,
    required TResult orElse(),
  }) {
    if (editing != null) {
      return editing(this);
    }
    return orElse();
  }
}

abstract class EditorEditingState implements EditorState {
  const factory EditorEditingState(NoteModel note) = _$EditorEditingState;

  NoteModel get note => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditorEditingStateCopyWith<EditorEditingState> get copyWith =>
      throw _privateConstructorUsedError;
}

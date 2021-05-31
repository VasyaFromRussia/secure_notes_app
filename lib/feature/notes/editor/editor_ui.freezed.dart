// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'editor_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditorScreenArgumentsTearOff {
  const _$EditorScreenArgumentsTearOff();

  _EditorScreenArguments call({String? noteId, String? heroTag}) {
    return _EditorScreenArguments(
      noteId: noteId,
      heroTag: heroTag,
    );
  }
}

/// @nodoc
const $EditorScreenArguments = _$EditorScreenArgumentsTearOff();

/// @nodoc
mixin _$EditorScreenArguments {
  String? get noteId => throw _privateConstructorUsedError;
  String? get heroTag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditorScreenArgumentsCopyWith<EditorScreenArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorScreenArgumentsCopyWith<$Res> {
  factory $EditorScreenArgumentsCopyWith(EditorScreenArguments value,
          $Res Function(EditorScreenArguments) then) =
      _$EditorScreenArgumentsCopyWithImpl<$Res>;
  $Res call({String? noteId, String? heroTag});
}

/// @nodoc
class _$EditorScreenArgumentsCopyWithImpl<$Res>
    implements $EditorScreenArgumentsCopyWith<$Res> {
  _$EditorScreenArgumentsCopyWithImpl(this._value, this._then);

  final EditorScreenArguments _value;
  // ignore: unused_field
  final $Res Function(EditorScreenArguments) _then;

  @override
  $Res call({
    Object? noteId = freezed,
    Object? heroTag = freezed,
  }) {
    return _then(_value.copyWith(
      noteId: noteId == freezed
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String?,
      heroTag: heroTag == freezed
          ? _value.heroTag
          : heroTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$EditorScreenArgumentsCopyWith<$Res>
    implements $EditorScreenArgumentsCopyWith<$Res> {
  factory _$EditorScreenArgumentsCopyWith(_EditorScreenArguments value,
          $Res Function(_EditorScreenArguments) then) =
      __$EditorScreenArgumentsCopyWithImpl<$Res>;
  @override
  $Res call({String? noteId, String? heroTag});
}

/// @nodoc
class __$EditorScreenArgumentsCopyWithImpl<$Res>
    extends _$EditorScreenArgumentsCopyWithImpl<$Res>
    implements _$EditorScreenArgumentsCopyWith<$Res> {
  __$EditorScreenArgumentsCopyWithImpl(_EditorScreenArguments _value,
      $Res Function(_EditorScreenArguments) _then)
      : super(_value, (v) => _then(v as _EditorScreenArguments));

  @override
  _EditorScreenArguments get _value => super._value as _EditorScreenArguments;

  @override
  $Res call({
    Object? noteId = freezed,
    Object? heroTag = freezed,
  }) {
    return _then(_EditorScreenArguments(
      noteId: noteId == freezed
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String?,
      heroTag: heroTag == freezed
          ? _value.heroTag
          : heroTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditorScreenArguments implements _EditorScreenArguments {
  const _$_EditorScreenArguments({this.noteId, this.heroTag});

  @override
  final String? noteId;
  @override
  final String? heroTag;

  @override
  String toString() {
    return 'EditorScreenArguments(noteId: $noteId, heroTag: $heroTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EditorScreenArguments &&
            (identical(other.noteId, noteId) ||
                const DeepCollectionEquality().equals(other.noteId, noteId)) &&
            (identical(other.heroTag, heroTag) ||
                const DeepCollectionEquality().equals(other.heroTag, heroTag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(noteId) ^
      const DeepCollectionEquality().hash(heroTag);

  @JsonKey(ignore: true)
  @override
  _$EditorScreenArgumentsCopyWith<_EditorScreenArguments> get copyWith =>
      __$EditorScreenArgumentsCopyWithImpl<_EditorScreenArguments>(
          this, _$identity);
}

abstract class _EditorScreenArguments implements EditorScreenArguments {
  const factory _EditorScreenArguments({String? noteId, String? heroTag}) =
      _$_EditorScreenArguments;

  @override
  String? get noteId => throw _privateConstructorUsedError;
  @override
  String? get heroTag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EditorScreenArgumentsCopyWith<_EditorScreenArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

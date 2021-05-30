// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NoteModelTearOff {
  const _$NoteModelTearOff();

  _NoteModel call({required NoteMetaModel meta, required String content}) {
    return _NoteModel(
      meta: meta,
      content: content,
    );
  }
}

/// @nodoc
const $NoteModel = _$NoteModelTearOff();

/// @nodoc
mixin _$NoteModel {
  NoteMetaModel get meta => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteModelCopyWith<NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteModelCopyWith<$Res> {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) then) =
      _$NoteModelCopyWithImpl<$Res>;
  $Res call({NoteMetaModel meta, String content});

  $NoteMetaModelCopyWith<$Res> get meta;
}

/// @nodoc
class _$NoteModelCopyWithImpl<$Res> implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._value, this._then);

  final NoteModel _value;
  // ignore: unused_field
  final $Res Function(NoteModel) _then;

  @override
  $Res call({
    Object? meta = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NoteMetaModel,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $NoteMetaModelCopyWith<$Res> get meta {
    return $NoteMetaModelCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc
abstract class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(
          _NoteModel value, $Res Function(_NoteModel) then) =
      __$NoteModelCopyWithImpl<$Res>;
  @override
  $Res call({NoteMetaModel meta, String content});

  @override
  $NoteMetaModelCopyWith<$Res> get meta;
}

/// @nodoc
class __$NoteModelCopyWithImpl<$Res> extends _$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(_NoteModel _value, $Res Function(_NoteModel) _then)
      : super(_value, (v) => _then(v as _NoteModel));

  @override
  _NoteModel get _value => super._value as _NoteModel;

  @override
  $Res call({
    Object? meta = freezed,
    Object? content = freezed,
  }) {
    return _then(_NoteModel(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NoteMetaModel,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoteModel implements _NoteModel {
  const _$_NoteModel({required this.meta, required this.content});

  @override
  final NoteMetaModel meta;
  @override
  final String content;

  @override
  String toString() {
    return 'NoteModel(meta: $meta, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteModel &&
            (identical(other.meta, meta) ||
                const DeepCollectionEquality().equals(other.meta, meta)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(meta) ^
      const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);
}

abstract class _NoteModel implements NoteModel {
  const factory _NoteModel(
      {required NoteMetaModel meta, required String content}) = _$_NoteModel;

  @override
  NoteMetaModel get meta => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteModelCopyWith<_NoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$NoteMetaModelTearOff {
  const _$NoteMetaModelTearOff();

  _NoteMetaModel call(
      {required String id,
      required String title,
      required DateTime lastModifiedAt}) {
    return _NoteMetaModel(
      id: id,
      title: title,
      lastModifiedAt: lastModifiedAt,
    );
  }
}

/// @nodoc
const $NoteMetaModel = _$NoteMetaModelTearOff();

/// @nodoc
mixin _$NoteMetaModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteMetaModelCopyWith<NoteMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteMetaModelCopyWith<$Res> {
  factory $NoteMetaModelCopyWith(
          NoteMetaModel value, $Res Function(NoteMetaModel) then) =
      _$NoteMetaModelCopyWithImpl<$Res>;
  $Res call({String id, String title, DateTime lastModifiedAt});
}

/// @nodoc
class _$NoteMetaModelCopyWithImpl<$Res>
    implements $NoteMetaModelCopyWith<$Res> {
  _$NoteMetaModelCopyWithImpl(this._value, this._then);

  final NoteMetaModel _value;
  // ignore: unused_field
  final $Res Function(NoteMetaModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? lastModifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedAt: lastModifiedAt == freezed
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$NoteMetaModelCopyWith<$Res>
    implements $NoteMetaModelCopyWith<$Res> {
  factory _$NoteMetaModelCopyWith(
          _NoteMetaModel value, $Res Function(_NoteMetaModel) then) =
      __$NoteMetaModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, DateTime lastModifiedAt});
}

/// @nodoc
class __$NoteMetaModelCopyWithImpl<$Res>
    extends _$NoteMetaModelCopyWithImpl<$Res>
    implements _$NoteMetaModelCopyWith<$Res> {
  __$NoteMetaModelCopyWithImpl(
      _NoteMetaModel _value, $Res Function(_NoteMetaModel) _then)
      : super(_value, (v) => _then(v as _NoteMetaModel));

  @override
  _NoteMetaModel get _value => super._value as _NoteMetaModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? lastModifiedAt = freezed,
  }) {
    return _then(_NoteMetaModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedAt: lastModifiedAt == freezed
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_NoteMetaModel implements _NoteMetaModel {
  const _$_NoteMetaModel(
      {required this.id, required this.title, required this.lastModifiedAt});

  @override
  final String id;
  @override
  final String title;
  @override
  final DateTime lastModifiedAt;

  @override
  String toString() {
    return 'NoteMetaModel(id: $id, title: $title, lastModifiedAt: $lastModifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteMetaModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastModifiedAt, lastModifiedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(lastModifiedAt);

  @JsonKey(ignore: true)
  @override
  _$NoteMetaModelCopyWith<_NoteMetaModel> get copyWith =>
      __$NoteMetaModelCopyWithImpl<_NoteMetaModel>(this, _$identity);
}

abstract class _NoteMetaModel implements NoteMetaModel {
  const factory _NoteMetaModel(
      {required String id,
      required String title,
      required DateTime lastModifiedAt}) = _$_NoteMetaModel;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NoteMetaModelCopyWith<_NoteMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

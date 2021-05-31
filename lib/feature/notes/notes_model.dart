import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'notes_model.freezed.dart';

abstract class NotesRepository {
  Stream<List<NoteMetaModel>> watchNotesMeta();

  Future<NoteModel> getNote(String id);

  Future<void> saveNote(NoteModel note);

  Future<void> deleteAll();

  Future<void> reset();
}

abstract class FileStorage<T> {
  Future<T> read(String filename);

  Future<void> write(String filename, T contents);

  Future<DateTime> lastModifiedAt(String filename);

  Future<void> clear();

  Future<List<File>> getFiles();
}

@freezed
class NoteModel with _$NoteModel {
  factory NoteModel.empty({
    required String id,
    required DateTime now,
  }) =>
      NoteModel(
        meta: NoteMetaModel.empty(id: id, now: now),
        content: '',
      );

  const factory NoteModel({
    required NoteMetaModel meta,
    required String content,
  }) = _NoteModel;
}

@freezed
class NoteMetaModel with _$NoteMetaModel {
  factory NoteMetaModel.empty({
    required String id,
    required DateTime now,
  }) =>
      NoteMetaModel(
        id: id,
        title: '',
        lastModifiedAt: now,
      );

  const factory NoteMetaModel({
    required String id,
    required String title,
    required DateTime lastModifiedAt,
  }) = _NoteMetaModel;
}

extension NoteModelGetters on NoteModel {
  String get id => meta.id;

  String get title => meta.title;

  DateTime get lastModifiedAt => meta.lastModifiedAt;

  NoteModel update(String title, String content) => copyWith.meta(title: title).copyWith(content: content);
}

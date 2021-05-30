import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:path/path.dart' as path;

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl({
    required this.titleStorage,
    required this.contentStorage,
  });

  final FileStorage titleStorage;
  final FileStorage contentStorage;

  final _actionStreamControllers = <StreamController<_Action>>[];

  @override
  Future<NoteModel> getNote(String id) async {
    final meta = await _getMeta(id);
    final content = await contentStorage.read(id);

    return NoteModel(
      meta: meta,
      content: content,
    );
  }

  @override
  Future<void> saveNote(NoteModel note) async {
    await titleStorage.write(note.id, note.title);
    await contentStorage.write(note.id, note.content);

    _actionStreamControllers.forEach((controller) {
      if (!controller.isClosed) {
        controller.add(_Action.save);
      }
    });
  }

  @override
  Stream<List<NoteMetaModel>> watchNotesMeta() {
    final updatesController = StreamController<_Action>();
    _actionStreamControllers.add(updatesController);

    return StreamGroup.merge([
      _watchNotesMeta(),
      updatesController.stream.asyncExpand((_) => _watchNotesMeta()),
    ]);
  }

  @override
  Future<void> reset() async {
    for (var controller in _actionStreamControllers) {
      await controller.close();
    }
  }

  Future<NoteMetaModel> _getMeta(String id) async {
    final title = await titleStorage.read(id);
    final lastModifiedAt = await titleStorage.lastModifiedAt(id);

    return NoteMetaModel(id: id, title: title, lastModifiedAt: lastModifiedAt);
  }

  Stream<List<NoteMetaModel>> _watchNotesMeta() => Stream.fromFuture(
        titleStorage.getFiles(),
      ).asyncMap(
        (files) => Stream.fromIterable(files)
            .asyncMap(
              (file) => _getMeta(path.basenameWithoutExtension(file.path)),
            )
            .toList(),
      );
}

enum _Action { save }

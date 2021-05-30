import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/notes/notes_model_repository.dart';
import 'package:secure_notes/feature/notes/notes_model_storage.dart';
import 'package:secure_notes/utils/io.dart';
import 'package:path/path.dart' as path;

void main() {
  late Directory testDirectory;

  setUp(() async {
    testDirectory = await Directory.current.getDirectory('test_files', create: true);
  });

  tearDown(() async {
    await testDirectory.delete(recursive: true);
  });

  test(
    'Given saved notes, when get list of meta, then it loads correctly',
    () async {
      final titleStorage = PlainTextFileStorage(directory: testDirectory);
      final contentStorage = PlainTextFileStorage(directory: testDirectory);
      final repository = NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);

      final ids = ['1', '2', '3'];
      final titles = ids.map((e) => 'Title $e').toList();
      for (var i = 0; i < ids.length; i++) {
        await titleStorage.write(ids[i], titles[i]);
      }

      final storedMeta = await repository.watchNotesMeta().first;
      final storedIds = storedMeta.map((e) => e.id).toList()..sort();
      final storedTitles = storedMeta.map((e) => e.title).toList()..sort();

      expect(storedIds, ids);
      expect(storedTitles, titles);
    },
  );

  test(
    'Given not stored note to save, when save it, then it appears on disk',
    () async {
      final titleStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.t');
      final contentStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.c');
      final repository = NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);

      final expectedNote = NoteModel(
        meta: NoteMetaModel(
          id: '1',
          title: 'title',
          lastModifiedAt: DateTime.now(),
        ),
        content: 'content',
      );
      await repository.saveNote(expectedNote);

      final titleFile = (await titleStorage.getFiles()).first;
      final contentFile = (await contentStorage.getFiles()).first;
      expect(path.basenameWithoutExtension(titleFile.path), expectedNote.id);
      expect(path.basenameWithoutExtension(contentFile.path), expectedNote.id);
    },
  );

  test(
    'Given stored note, when read it, then content is valid',
    () async {
      final titleStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.t');
      final contentStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.c');
      final repository = NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);
      final expectedNote = NoteModel(
        meta: NoteMetaModel(
          id: '1',
          title: 'title',
          lastModifiedAt: DateTime.now(),
        ),
        content: 'content',
      );
      await repository.saveNote(expectedNote);

      final storedNote = await repository.getNote(expectedNote.id);

      expect(storedNote.id, expectedNote.id);
      expect(storedNote.title, expectedNote.title);
      expect(storedNote.content, expectedNote.content);
    },
  );

  test(
    'Given stored note, when modify it, then updated content is valid',
    () async {
      final titleStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.t');
      final contentStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.c');
      final repository = NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);
      final originalNote = NoteModel(
        meta: NoteMetaModel(
          id: '1',
          title: 'title',
          lastModifiedAt: DateTime.now(),
        ),
        content: 'content',
      );
      await repository.saveNote(originalNote);

      final modifiedNote = originalNote.copyWith(
        content: 'modified content',
        meta: originalNote.meta.copyWith(
          title: 'modified title',
        ),
      );
      await repository.saveNote(modifiedNote);

      final storedNote = await repository.getNote(originalNote.id);
      expect(storedNote.id, modifiedNote.id);
      expect(storedNote.title, modifiedNote.title);
      expect(storedNote.content, modifiedNote.content);
    },
  );

  test(
    'Given directory with file, when store one more file, then file watcher notifies',
    () async {
      final titleStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.t');
      final contentStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: '.c');
      final repository = NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);
      final firstNote = NoteModel(
        meta: NoteMetaModel(
          id: '1',
          title: 'title',
          lastModifiedAt: DateTime.now(),
        ),
        content: 'content',
      );
      await repository.saveNote(firstNote);

      final stream = repository.watchNotesMeta();

      final secondNote = NoteModel(
        meta: NoteMetaModel(
          id: '2',
          title: 'another title',
          lastModifiedAt: DateTime.now(),
        ),
        content: 'another content',
      );
      await repository.saveNote(secondNote);

      await expectLater(
          stream.map((list) => list.map((meta) => meta.id)),
          emitsInOrder([
            [firstNote.id],
            [firstNote.id, secondNote.id],
          ]));
    },
  );
}

import 'package:bloc_test/bloc_test.dart' hide when, any, reset, verify;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/exception.dart';

import '../notes_bloc_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  final notesRepository = MockNotesRepository();
  
  final note = NoteModel(
    meta: NoteMetaModel(
      id: '1',
      title: 'title',
      lastModifiedAt: DateTime.utc(2021),
    ),
    content: 'content',
  );
  
  setUp(() {
    reset(notesRepository);
  });

  blocTest<EditorCubit, EditorState>(
    'Given bloc initializing, when id is not passed, then final state is Editing',
    build: () => EditorCubit(notesRepository: notesRepository),
    act: (cubit) => cubit.init(id: null),
    expect: () => [
      EditorState.loading(),
      EditorState.editing(NoteModel.empty()),
    ],
  );

  blocTest<EditorCubit, EditorState>(
    'Given bloc initializing, when id is passed, then final state is Reading',
    build: () {
      when(notesRepository.getNote(any)).thenAnswer((invocation) => Future.value(note));
      return EditorCubit(notesRepository: notesRepository);
    },
    act: (cubit) => cubit.init(id: note.id),
    expect: () => [
      EditorState.loading(),
      EditorState.reading(note),
    ],
  );

  blocTest<EditorCubit, EditorState>(
    'Given bloc in loading state, when trying to switch to editing mode, then it fails',
    build: () => EditorCubit(notesRepository: notesRepository),
    seed: () => EditorState.loading(),
    act: (cubit) => cubit.edit(),
    errors: () => [
      isA<IllegalStateException>(),
    ],
  );

  blocTest<EditorCubit, EditorState>(
    'Given bloc in reading state, when trying to switch to editing mode, then it succeeds',
    build: () => EditorCubit(notesRepository: notesRepository),
    seed: () => EditorState.reading(note),
    act: (cubit) => cubit.edit(),
    expect: () => [
      EditorState.editing(note),
    ],
  );

  blocTest<EditorCubit, EditorState>(
    'Given bloc in loading state, when trying to save mode, then it fails',
    build: () => EditorCubit(notesRepository: notesRepository),
    seed: () => EditorState.loading(),
    act: (cubit) => cubit.save(title: 'title', content: 'content'),
    errors: () => [
      isA<IllegalStateException>(),
    ],
  );

  final modifiedTitle = 'modified title';
  final modifiedContent = 'modified content';
  final modifiedNote = note.update(modifiedTitle, modifiedContent);
  blocTest<EditorCubit, EditorState>(
    'Given bloc in editing state, when trying to save mode, then it succeeds',
    build: () {
      when(notesRepository.saveNote(any)).thenAnswer((realInvocation) => Future.value());
      return EditorCubit(notesRepository: notesRepository);
    },
    seed: () => EditorState.editing(note),
    act: (cubit) async => cubit.save(title: modifiedTitle, content: modifiedContent),
    verify: (cubit) {
      verify(notesRepository.saveNote(modifiedNote));
    },
    expect: () => [
      EditorState.reading(modifiedNote),
    ],
  );
}

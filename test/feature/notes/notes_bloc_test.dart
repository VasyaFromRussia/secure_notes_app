import 'package:bloc_test/bloc_test.dart' hide when;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';

import 'notes_bloc_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  blocTest<NotesCubit, NotesState>(
    'Given bloc instantiation, when it is created, then state is Loading',
    build: () {
      final notesRepository = MockNotesRepository();
      when(notesRepository.watchNotesMeta()).thenAnswer((invocation) => Stream.empty());
      return NotesCubit(notesRepository: notesRepository);
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      NotesState.loading(),
    ],
  );

  final meta = NoteMetaModel(id: '1', title: 'title', lastModifiedAt: DateTime.utc(2021));
  blocTest<NotesCubit, NotesState>(
    'Given bloc initializing, when data is available, then it is returned in Data state',
    build: () {
      final notesRepository = MockNotesRepository();
      when(notesRepository.watchNotesMeta()).thenAnswer((invocation) => Stream.value([meta]));
      return NotesCubit(notesRepository: notesRepository);
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      NotesState.loading(),
      NotesState.data(data: [meta]),
    ],
  );
}

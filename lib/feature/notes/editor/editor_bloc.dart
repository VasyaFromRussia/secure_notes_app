import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/date.dart';
import 'package:secure_notes/utils/exception.dart';
import 'package:uuid/uuid.dart';

part 'editor_bloc.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.loading() = EditorLoadingState;

  const factory EditorState.reading(NoteModel note) = EditorReadingState;

  const factory EditorState.editing(NoteModel note) = EditorEditingState;
}

class EditorCubit extends Cubit<EditorState> {
  EditorCubit({
    required this.notesRepository,
    required this.defaultTitle,
    NoteIdGenerator? noteIdGenerator,
    CurrentDateTimeProvider? currentDateTimeProvider,
  }) : super(EditorState.loading()) {
    this.noteIdGenerator = noteIdGenerator ?? () => Uuid().v1();
    this.currentDateTimeProvider = currentDateTimeProvider ?? () => DateTime.now();
  }

  final NotesRepository notesRepository;
  final String defaultTitle;
  late final NoteIdGenerator noteIdGenerator;
  late final CurrentDateTimeProvider currentDateTimeProvider;

  Future<void> init({required String? id}) async {
    emit(EditorState.loading());
    if (id != null) {
      final note = await notesRepository.getNote(id);
      emit(EditorState.reading(note));
    } else {
      emit(
        EditorState.editing(
          NoteModel.empty(
            id: noteIdGenerator(),
            now: currentDateTimeProvider(),
          ),
        ),
      );
    }
  }

  void edit() {
    final currentState = state;
    if (currentState is EditorReadingState) {
      emit(EditorState.editing(currentState.note));
    } else {
      throw IllegalStateException('Cannot switch to editing mode from ${currentState.runtimeType}');
    }
  }

  Future<void> save({
    required String title,
    required String content,
  }) async {
    final currentState = state;
    if (currentState is EditorEditingState) {
      final modifiedTitle = title.isNotEmpty ? title : defaultTitle;
      final modifiedNote = currentState.note.update(modifiedTitle, content);
      await notesRepository.saveNote(modifiedNote);
      emit(EditorState.reading(modifiedNote));
    } else {
      throw IllegalStateException('Cannot save from ${currentState.runtimeType}');
    }
  }
}

typedef NoteIdGenerator = String Function();

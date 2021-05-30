import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/exception.dart';

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
  }) : super(EditorState.loading());

  final NotesRepository notesRepository;

  Future<void> init({required String? id}) async {
    emit(EditorState.loading());
    if (id != null) {
      final note = await notesRepository.getNote(id);
      emit(EditorState.reading(note));
    } else {
      emit(EditorState.editing(NoteModel.empty()));
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
      final modifiedNote = currentState.note.update(title, content);
      await notesRepository.saveNote(modifiedNote);
      emit(EditorState.reading(modifiedNote));
    } else {
      throw IllegalStateException('Cannot save from ${currentState.runtimeType}');
    }
  }
}
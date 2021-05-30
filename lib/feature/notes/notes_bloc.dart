import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';

part 'notes_bloc.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.loading() = NotesLoadingState;

  const factory NotesState.data({
    required List<NoteMetaModel> data,
  }) = NotesDataState;
}

class NotesCubit extends Cubit<NotesState> {
  NotesCubit({
    required this.notesRepository,
  }) : super(NotesState.loading());

  final NotesRepository notesRepository;
  late StreamSubscription _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }

  void init() {
    emit(NotesState.loading());
    _subscription = notesRepository.watchNotesMeta().listen(
          (data) => emit(NotesState.data(data: data)),
        );
  }
}

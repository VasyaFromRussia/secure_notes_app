import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/common/common_ui.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/resources/strings.dart';
import 'package:secure_notes/utils/di.dart';

class EditorBlocProvider extends StatelessWidget {
  const EditorBlocProvider({
    Key? key,
    required this.child,
    this.noteId,
  }) : super(key: key);

  final Widget child;
  final String? noteId;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: injectAsync<NotesRepository>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return BlocProvider(
              create: (context) => EditorCubit(
                notesRepository: snapshot.data as NotesRepository,
                defaultTitle: AppStrings.editorDefaultTitle,
              )..init(id: noteId),
              lazy: true,
              child: child,
            );
          } else {
            return LoaderWidget();
          }
        },
      );
}

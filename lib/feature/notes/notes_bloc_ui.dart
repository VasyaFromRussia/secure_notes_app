import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/di.dart';

class NotesBlocProvider extends StatelessWidget {
  const NotesBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: injectAsync<NotesRepository>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return BlocProvider(
              create: (context) => NotesCubit(notesRepository: snapshot.data as NotesRepository)..init(),
              lazy: true,
              child: child,
            );
          } else {
            return _buildLoadingState(context);
          }
        },
      );

  Widget _buildLoadingState(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/navigator.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<NotesCubit, NotesState>(
          bloc: BlocProvider.of<NotesCubit>(context),
          builder: (context, state) => state.when(
            loading: () => _buildLoadingState(context),
            data: (data) => _buildDataState(context, data),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () => AppNavigator.navigateEditor(context, null),
        ),
      );

  Widget _buildLoadingState(BuildContext context) => Container(child: Center(child: Text('loading')));

  Widget _buildDataState(BuildContext context, List<NoteMetaModel> meta) => meta.isEmpty ? _buildEmptyState(context) : _buildListState(context, meta);

  Widget _buildEmptyState(BuildContext context) => Container(child: Center(child: Text('empty')));

  Widget _buildListState(BuildContext context, List<NoteMetaModel> meta) => ListView.builder(
        itemBuilder: (context, index) => Text(meta[index].id),
        itemCount: meta.length,
      );
}

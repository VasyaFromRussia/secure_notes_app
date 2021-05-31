import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/navigator.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: BlocBuilder<NotesCubit, NotesState>(
          bloc: BlocProvider.of<NotesCubit>(context),
          builder: (context, state) => state.when(
            loading: () => _buildLoadingState(context),
            data: (data) => _buildDataState(context, data),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit, color: Theme.of(context).backgroundColor),
          onPressed: () => _navigateToEditor(context, null),
        ),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(elevation: 0, backgroundColor: Colors.transparent);

  Widget _buildLoadingState(BuildContext context) => Container(child: Center(child: Text('loading')));

  Widget _buildDataState(BuildContext context, List<NoteMetaModel> meta) => meta.isEmpty ? _buildEmptyState(context) : _buildListState(context, meta);

  Widget _buildEmptyState(BuildContext context) => Container(child: Center(child: Text('empty')));

  Widget _buildListState(BuildContext context, List<NoteMetaModel> meta) => ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => _buildListTile(context, meta[index]),
        itemCount: meta.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
      );

  Widget _buildListTile(BuildContext context, NoteMetaModel meta) => Hero(
        tag: meta.id,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).backgroundColor,
          child: InkWell(
            onTap: () => _navigateToEditor(context, meta.id),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(meta.title, style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 2),
                  Text(meta.lastModifiedAt.toString(), style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
          ),
        ),
      );

  void _navigateToEditor(BuildContext context, String? noteId) => AppNavigator.navigateToEditor(context, noteId);
}

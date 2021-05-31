import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc_ui.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({
    Key? key,
    this.noteId,
  }) : super(key: key);

  final String? noteId;

  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) => EditorBlocProvider(
        noteId: widget.noteId,
        child: Builder(
          builder: (context) => Scaffold(
            appBar: _buildAppBar(context),
            body: _buildBody(context),
          ),
        ),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          _buildConfirmationActionButton(context),
        ],
      );

  Widget _buildBody(BuildContext context) => BlocBuilder<EditorCubit, EditorState>(
        bloc: BlocProvider.of<EditorCubit>(context),
        builder: (context, state) => state.when(
          loading: () => _buildLoadingState(context),
          reading: (note) => _buildReadingState(context),
          editing: (note) => _buildEditingState(context),
        ),
      );

  Widget _buildLoadingState(BuildContext context) => Center(child: Text('loading'));

  Widget _buildReadingState(BuildContext context) => _buildNoteArea(context, enabled: false);

  Widget _buildEditingState(BuildContext context) => _buildNoteArea(context, enabled: true);

  Widget _buildNoteArea(BuildContext context, {required bool enabled}) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextInputWidget(controller: _titleController, enabled: enabled),
              TextInputWidget(controller: _contentController, enabled: enabled),
            ],
          ),
        ),
      );

  Widget _buildConfirmationActionButton(BuildContext context) => IconButton(
        onPressed: () => BlocProvider.of<EditorCubit>(context).save(
          title: _titleController.text,
          content: _contentController.text,
        ),
        icon: Icon(Icons.check),
      );
}

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key? key,
    required this.controller,
    required this.enabled,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        enabled: enabled,
      );
}

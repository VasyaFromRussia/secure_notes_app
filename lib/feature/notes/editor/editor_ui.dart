import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc_ui.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/resources/theme.dart';

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
          builder: (context) => BlocConsumer<EditorCubit, EditorState>(
            bloc: BlocProvider.of<EditorCubit>(context),
            builder: (context, state) => Scaffold(
              appBar: _buildAppBar(context, state),
              body: _buildBody(context, state),
            ),
            listener: (oldState, newState) {
              if (newState is EditorReadingState) {
                _titleController.text = newState.note.title;
                _contentController.text = newState.note.content;
              }
            },
          ),
        ),
      );

  AppBar _buildAppBar(BuildContext context, EditorState state) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: state.maybeWhen(
          reading: (_) => [_buildEditActionButton(context)],
          editing: (_) => [_buildConfirmationActionButton(context)],
          orElse: () => [],
        ),
      );

  Widget _buildBody(BuildContext context, EditorState state) => state.when(
        loading: () => _buildLoadingState(context),
        reading: (note) => _buildReadingState(context),
        editing: (note) => _buildEditingState(context),
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
              _buildTitleInput(context, enabled: enabled),
              _buildContentInput(context, enabled: enabled),
            ],
          ),
        ),
      );

  Widget _buildTitleInput(BuildContext context, {required bool enabled}) => TextInputWidget(
        controller: _titleController,
        enabled: enabled,
        hint: 'Заголовок',
        textStyle: Theme.of(context).textTheme.headline5,
        hintStyle: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.inactiveColor),
      );

  Widget _buildContentInput(BuildContext context, {required bool enabled}) => TextInputWidget(
        controller: _contentController,
        enabled: enabled,
        hint: 'Заметка',
        textStyle: Theme.of(context).textTheme.bodyText1,
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.inactiveColor),
      );

  Widget _buildEditActionButton(BuildContext context) => IconButton(
        onPressed: BlocProvider.of<EditorCubit>(context).edit,
        icon: Icon(Icons.edit),
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
    required this.textStyle,
    required this.hint,
    required this.hintStyle,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;
  final TextStyle? textStyle;
  final String hint;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        enabled: enabled,
        style: textStyle,
        decoration: InputDecoration(
          hintStyle: hintStyle,
          hintText: hint,
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      );
}

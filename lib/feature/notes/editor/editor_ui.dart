import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/common/common_ui.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc.dart';
import 'package:secure_notes/feature/notes/editor/editor_bloc_ui.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/resources/strings.dart';
import 'package:secure_notes/feature/resources/theme.dart';
import 'package:secure_notes/utils/resources.dart';

part 'editor_ui.freezed.dart';

@freezed
class EditorScreenArguments with _$EditorScreenArguments {
  const factory EditorScreenArguments({
    String? noteId,
    String? heroTag,
  }) = _EditorScreenArguments;
}

class EditorScreen extends StatefulWidget {
  EditorScreen({
    Key? key,
    required EditorScreenArguments arguments,
  }) : super(key: key) {
    noteId = arguments.noteId;
    heroTag = arguments.heroTag;
  }

  late final String? noteId;
  late final String? heroTag;

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
            builder: _buildScreen,
            listener: _handleStateChange,
          ),
        ),
      );

  Widget _buildScreen(BuildContext context, EditorState state) => Scaffold(
        appBar: _buildAppBar(context, state),
        body: _buildBody(context, state),
      );

  void _handleStateChange(BuildContext context, EditorState newState) {
    if (newState is EditorReadingState) {
      _titleController.text = newState.note.title;
      _contentController.text = newState.note.content;
    }
  }

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

  Widget _buildLoadingState(BuildContext context) => LoaderWidget();

  Widget _buildReadingState(BuildContext context) => _buildDecoratedNoteArea(context, enabled: false);

  Widget _buildEditingState(BuildContext context) => _buildDecoratedNoteArea(context, enabled: true);

  Widget _buildDecoratedNoteArea(BuildContext context, {required bool enabled}) => widget.heroTag != null
      ? Hero(
          tag: widget.heroTag!,
          child: _buildNoteArea(context, enabled: enabled),
        )
      : _buildNoteArea(context, enabled: enabled);

  Widget _buildNoteArea(BuildContext context, {required bool enabled}) => CardContainer(
        child: Column(
          children: [
            _buildTitleInput(context, enabled: enabled),
            Expanded(child: _buildContentInput(context, enabled: enabled)),
          ],
        ),
      );

  Widget _buildTitleInput(BuildContext context, {required bool enabled}) => TextInputWidget(
        controller: _titleController,
        enabled: enabled,
        hint: AppStrings.editorTitleHint,
        textStyle: context.textTheme.headline5,
        hintStyle: context.textTheme.headline5?.copyWith(color: AppColors.inactiveColor),
        isMultiline: false,
      );

  Widget _buildContentInput(BuildContext context, {required bool enabled}) => TextInputWidget(
        controller: _contentController,
        enabled: enabled,
        hint: AppStrings.editorContentHint,
        textStyle: context.textTheme.bodyText1,
        hintStyle: context.textTheme.bodyText1?.copyWith(color: AppColors.inactiveColor),
        isMultiline: true,
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
    required this.isMultiline,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;
  final TextStyle? textStyle;
  final String hint;
  final TextStyle? hintStyle;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        enabled: enabled,
        style: textStyle,
        maxLines: isMultiline ? null : 1,
        decoration: InputDecoration(
          hintStyle: hintStyle,
          hintText: hint,
        ).applyDefaults(context.theme.inputDecorationTheme),
      );
}

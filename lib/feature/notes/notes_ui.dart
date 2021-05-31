import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secure_notes/feature/common/common_ui.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/resources/drawables.dart';
import 'package:secure_notes/feature/resources/strings.dart';
import 'package:secure_notes/feature/resources/theme.dart';
import 'package:secure_notes/navigator.dart';
import 'package:secure_notes/utils/resources.dart';

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

  AppBar _buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppStrings.notesTitle, style: context.textTheme.headline4?.copyWith(color: AppColors.textLight)),
      );

  Widget _buildLoadingState(BuildContext context) => LoaderWidget();

  Widget _buildDataState(BuildContext context, List<NoteMetaModel> meta) => meta.isEmpty ? _buildEmptyState(context) : _buildListState(context, meta);

  Widget _buildEmptyState(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Drawables.imageEmpty,
            width: imageSize,
            height: imageSize,
          ),
          SizedBox(height: 16),
          Text(
            AppStrings.notesEmpty,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyText1?.copyWith(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

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
                  Text(meta.title, style: context.textTheme.headline5),
                  SizedBox(height: 2),
                  Text(meta.lastModifiedAt.toString(), style: context.textTheme.bodyText1),
                ],
              ),
            ),
          ),
        ),
      );

  void _navigateToEditor(BuildContext context, String? noteId) => AppNavigator.navigateToEditor(context, noteId);
}

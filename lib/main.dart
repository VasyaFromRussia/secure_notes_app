import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_notes/feature/auth/auth_bloc.dart';
import 'package:secure_notes/feature/auth/auth_module.dart';
import 'package:secure_notes/feature/notes/note_module.dart';
import 'package:secure_notes/feature/notes/notes_bloc.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/navigator.dart';
import 'package:secure_notes/utils/di.dart';

final modules = [
  AuthModule(),
  NotesModule(),
];

void main() {
  runZonedGuarded(
    () async {
      await _initModules();
      runApp(MyApp());
    },
    (e, st) => print('${e.toString()}\n${st.toString()}'),
  );
}

Future<void> _initModules() async {
  for (var module in modules) {
    await module.register(GetIt.instance);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AuthCubit(
          authRepository: inject(),
          notesRepositoryProvider: () => injectAsync(),
        )..init(),
        child: AppNavigator(),
      );
}

class AuthStateResolver extends StatelessWidget {
  const AuthStateResolver({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
        bloc: BlocProvider.of<AuthCubit>(context),
        listener: (oldState, newState) => newState.maybeWhen(
          signIn: (hasError, succeed) {
            if (succeed) {
              AppNavigator.navigateNotes(context);
            } else if (!hasError) {
              AppNavigator.navigateToSignIn(context);
            }
          },
          signUp: (succeed) {
            if (succeed) {
              AppNavigator.navigateNotes(context);
            } else {
              AppNavigator.navigateToSignUp(context);
            }
          },
          orElse: () {},
        ),
        child: child,
      );
}

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

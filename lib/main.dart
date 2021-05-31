import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_notes/feature/auth/auth_bloc.dart';
import 'package:secure_notes/feature/auth/auth_module.dart';
import 'package:secure_notes/feature/auth/auth_ui.dart';
import 'package:secure_notes/feature/notes/note_module.dart';
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Text('Splashhhhh'),
      );
}

class AppNavigator extends StatelessWidget {
  static const _routeSplash = '/';
  static const _routeSignIn = '/sign_in';
  static const _routeSignUp = '/sign_up';
  static const _routeNotes = '/notes';
  static const _routeEditor = '/editor';

  static void navigateToSignIn(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeSignIn);

  static void navigateToSignUp(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeSignUp);

  static void navigateNotes(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeNotes);

  static void navigateEditor(BuildContext context, String noteId) => Navigator.of(context).pushNamed(_routeEditor, arguments: noteId);

  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        initialRoute: _routeSplash,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case _routeSplash:
              return MaterialPageRoute(builder: (context) => AuthStateResolver(child: SplashScreen()));
            case _routeSignIn:
              return MaterialPageRoute(builder: (context) => AuthStateResolver(child: SignInScreen()));
            case _routeSignUp:
              return MaterialPageRoute(builder: (context) => AuthStateResolver(child: SignUpScreen()));
            case _routeNotes:
              return MaterialPageRoute(builder: (context) => Container(color: Colors.deepOrange));
            case _routeEditor:
              return MaterialPageRoute(builder: (context) => Container(color: Colors.deepPurple));
            default:
              throw 'Unknown route: ${settings.name}';
          }
        },
      );
}

import 'package:flutter/material.dart';
import 'package:secure_notes/feature/auth/auth_ui.dart';
import 'package:secure_notes/feature/notes/editor/editor_ui.dart';
import 'package:secure_notes/feature/notes/notes_bloc_ui.dart';
import 'package:secure_notes/feature/notes/notes_ui.dart';
import 'package:secure_notes/feature/splash/splash_ui.dart';
import 'package:secure_notes/main.dart';

class AppNavigator extends StatelessWidget {
  static const _routeSplash = '/';
  static const _routeSignIn = '/sign_in';
  static const _routeSignUp = '/sign_up';
  static const _routeNotes = '/notes';
  static const _routeEditor = '/editor';

  static void navigateToSignIn(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeSignIn);

  static void navigateToSignUp(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeSignUp);

  static void navigateToNotes(BuildContext context) => Navigator.of(context).pushReplacementNamed(_routeNotes);

  static void navigateToEditor(BuildContext context, String? noteId) => Navigator.of(context).pushNamed(_routeEditor, arguments: noteId);

  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        initialRoute: _routeSplash,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => _buildScreen(settings)),
      );

  Widget _buildScreen(RouteSettings settings) {
    switch (settings.name) {
      case _routeSplash:
        return AuthStateResolver(child: SplashScreen());
      case _routeSignIn:
        return AuthStateResolver(child: SignInScreen());
      case _routeSignUp:
        return AuthStateResolver(child: SignUpScreen());
      case _routeNotes:
        return NotesBlocProvider(child: NotesListScreen());
      case _routeEditor:
        return NotesBlocProvider(child: EditorScreen(noteId: settings.arguments as String?));
      default:
        throw 'Unknown route: ${settings.name}';
    }
  }
}

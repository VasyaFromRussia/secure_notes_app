import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.signIn({
    required bool hasError,
    required bool succeed,
  }) = AuthSignInState;

  const factory AuthState.signUp({
    required bool succeed,
  }) = AuthSignUpState;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
    required this.notesRepositoryProvider,
  }) : super(AuthState.loading());

  final AuthRepository authRepository;
  final Future<NotesRepository> Function() notesRepositoryProvider;

  Future<void> init() async {
    emit(AuthState.loading());
    if (await authRepository.hasCredentials()) {
      emit(AuthState.signIn(hasError: false, succeed: false));
    } else {
      emit(AuthState.signUp(succeed: false));
    }
  }

  Future<void> signIn(String password) async {
    final succeed = await authRepository.signIn(password);
    emit(AuthState.signIn(hasError: !succeed, succeed: succeed));
  }

  Future<void> signUp(String password) async {
    await authRepository.signUp(password);
    emit(AuthState.signUp(succeed: true));
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    await notesRepositoryProvider().then((repository) => repository.deleteAll());
    emit(AuthState.signUp(succeed: false));
  }
}

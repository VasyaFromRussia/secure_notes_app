import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/date.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.signIn({
    required bool hasError,
    required bool succeed,
    required DateTime time,
  }) = AuthSignInState;

  const factory AuthState.signUp({
    required bool succeed,
  }) = AuthSignUpState;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
    required this.notesRepositoryProvider,
    CurrentDateTimeProvider? currentDateTimeProvider,
  }) : super(AuthState.loading()) {
    _currentTime = currentDateTimeProvider ?? () => DateTime.now();
  }

  final AuthRepository authRepository;
  final Future<NotesRepository> Function() notesRepositoryProvider;
  late final CurrentDateTimeProvider _currentTime;

  Future<void> init() async {
    emit(AuthState.loading());
    if (await authRepository.hasCredentials()) {
      emit(AuthState.signIn(hasError: false, succeed: false, time: _currentTime()));
    } else {
      emit(AuthState.signUp(succeed: false));
    }
  }

  Future<void> signIn(String password) async {
    final succeed = await authRepository.signIn(password);
    emit(AuthState.signIn(hasError: !succeed, succeed: succeed, time: _currentTime()));
  }

  Future<void> signUp(String password) async {
    await authRepository.signUp(password);
    emit(AuthState.signUp(succeed: true));
  }

  Future<void> signOut() async {
    await notesRepositoryProvider().then((repository) => repository.deleteAll());
    await authRepository.signOut();
    emit(AuthState.signUp(succeed: false));
  }
}

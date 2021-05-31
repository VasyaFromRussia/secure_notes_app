import 'package:bloc_test/bloc_test.dart' show blocTest;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secure_notes/feature/auth/auth_bloc.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([
  NotesRepository,
  AuthRepository,
])
void main() {
  final NotesRepository notesRepository = MockNotesRepository();
  final AuthRepository authRepository = MockAuthRepository();

  final now = DateTime.utc(2021);
  final currentDateTimeProvider = () => now;

  setUp(() {
    reset(notesRepository);
    reset(authRepository);
  });

  blocTest<AuthCubit, AuthState>(
    'Given user with no credentials, when it starts app, then they get SignUp state',
    build: () {
      when(authRepository.hasCredentials()).thenAnswer((_) async => false);
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      AuthState.loading(),
      AuthState.signUp(succeed: false),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Given user with credentials, when it starts app, then they get SignIn state',
    build: () {
      when(authRepository.hasCredentials()).thenAnswer((_) async => true);
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      AuthState.loading(),
      AuthState.signIn(succeed: false, hasError: false, time: now),
    ],
  );

  final password = 'password';
  blocTest<AuthCubit, AuthState>(
    'Given user with SignIn state, when they input correct password, then they get succeed SignIn state',
    build: () {
      when(authRepository.signIn(password)).thenAnswer((_) async => true);
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    seed: () => AuthState.signIn(succeed: false, hasError: false, time: now),
    act: (cubit) async => cubit.signIn(password),
    expect: () => [
      AuthState.signIn(succeed: true, hasError: false, time: now),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Given user with SignIn state, when they input wrong password, then they get SignIn state with error',
    build: () {
      when(authRepository.signIn(password)).thenAnswer((_) async => false);
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    seed: () => AuthState.signIn(succeed: false, hasError: false, time: now),
    act: (cubit) async => cubit.signIn(password),
    expect: () => [
      AuthState.signIn(succeed: false, hasError: true, time: now),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Given user with SignUp state, when they input password, then they get succeed SignUp',
    build: () {
      when(authRepository.signUp(password)).thenAnswer((_) => Future.value());
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    seed: () => AuthState.signUp(succeed: false),
    act: (cubit) async => cubit.signUp(password),
    expect: () => [
      AuthState.signUp(succeed: true),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Given user with SignIn state, when they reset data, then they get SignUp state',
    build: () {
      when(notesRepository.deleteAll()).thenAnswer((_) => Future.value());
      when(authRepository.signOut()).thenAnswer((_) => Future.value());
      return AuthCubit(
        notesRepositoryProvider: () => Future.value(notesRepository),
        authRepository: authRepository,
        currentDateTimeProvider: currentDateTimeProvider,
      );
    },
    seed: () => AuthState.signIn(succeed: false, hasError: false, time: now),
    act: (cubit) async => cubit.signOut(),
    verify: (_) {
      verify(notesRepository.deleteAll());
      verify(authRepository.signOut());
    },
    expect: () => [
      AuthState.signUp(succeed: false),
    ],
  );
}

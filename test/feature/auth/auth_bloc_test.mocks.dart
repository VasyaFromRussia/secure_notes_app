// Mocks generated by Mockito 5.0.9 from annotations
// in secure_notes/test/feature/auth/auth_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:secure_notes/feature/auth/auth_model.dart' as _i4;
import 'package:secure_notes/feature/notes/notes_model.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeNoteModel extends _i1.Fake implements _i2.NoteModel {}

/// A class which mocks [NotesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotesRepository extends _i1.Mock implements _i2.NotesRepository {
  MockNotesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<_i2.NoteMetaModel>> watchNotesMeta() =>
      (super.noSuchMethod(Invocation.method(#watchNotesMeta, []),
              returnValue: Stream<List<_i2.NoteMetaModel>>.empty())
          as _i3.Stream<List<_i2.NoteMetaModel>>);
  @override
  _i3.Future<_i2.NoteModel> getNote(String? id) =>
      (super.noSuchMethod(Invocation.method(#getNote, [id]),
              returnValue: Future<_i2.NoteModel>.value(_FakeNoteModel()))
          as _i3.Future<_i2.NoteModel>);
  @override
  _i3.Future<void> saveNote(_i2.NoteModel? note) =>
      (super.noSuchMethod(Invocation.method(#saveNote, [note]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteAll() =>
      (super.noSuchMethod(Invocation.method(#deleteAll, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> reset() => (super.noSuchMethod(Invocation.method(#reset, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i4.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> hasCredentials() =>
      (super.noSuchMethod(Invocation.method(#hasCredentials, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<void> signUp(String? password) =>
      (super.noSuchMethod(Invocation.method(#signUp, [password]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<bool> signIn(String? password) =>
      (super.noSuchMethod(Invocation.method(#signIn, [password]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<String?> getKey() =>
      (super.noSuchMethod(Invocation.method(#getKey, []),
          returnValue: Future<String?>.value()) as _i3.Future<String?>);
  @override
  _i3.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}
import 'dart:io';

import 'package:encrypt/encrypt.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/utils/io.dart';
import 'package:path/path.dart' as path;

class PlainTextFileStorage implements FileStorage<String> {
  PlainTextFileStorage({required this.directory});

  final Directory directory;

  @override
  Future<String> read(String filename) => _getFile(filename, create: true).then((file) => file.readAsString());

  @override
  Future<void> write(String filename, String contents) async {
    final file = await _getFile(filename, create: true);
    await file.writeAsString(contents, flush: true);
  }

  @override
  Future<DateTime> lastModifiedAt(String filename) async {
    final file = await _getFile(filename, create: false);
    return await file.lastModified();
  }

  @override
  Future<void> clear() async {
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }

  @override
  Future<List<File>> getFiles() => directory
      .list()
      .where(
        (entity) => entity is File,
      )
      .toList()
      .then((value) => value.cast());

  Future<File> _getFile(String filename, {bool create = false}) async => directory.getFile(filename, create: create);
}

class TypedPlainTextFileStorage implements FileStorage<String> {
  TypedPlainTextFileStorage({
    required Directory directory,
    required this.fileExtension,
  })  : assert(fileExtension.startsWith('.'), 'File extension must start with \'.\' symbol'),
        this._delegate = PlainTextFileStorage(directory: directory);

  final String fileExtension;
  final FileStorage<String> _delegate;

  @override
  Future<String> read(String filename) => _delegate.read(_composeFileName(filename));

  @override
  Future<void> write(String filename, String contents) => _delegate.write(_composeFileName(filename), contents);

  @override
  Future<DateTime> lastModifiedAt(String filename) => _delegate.lastModifiedAt(_composeFileName(filename));

  @override
  Future<void> clear() => _delegate.clear();

  @override
  Future<List<File>> getFiles() => _delegate.getFiles().then((value) => value
      .where(
        (element) => path.extension(element.path) == fileExtension,
      )
      .toList());

  String _composeFileName(String filename) => '$filename$fileExtension';
}

class EncryptedFileStorage implements FileStorage<String> {
  EncryptedFileStorage({
    required String key,
    required this.delegate,
  })  : iv = IV.fromLength(16),
        encrypter = Encrypter(AES(Key.fromUtf8(key), padding: null));

  final FileStorage<String> delegate;
  final IV iv;
  final Encrypter encrypter;

  @override
  Future<String> read(String filename) async {
    final encryptedContent = Encrypted.fromBase64(await delegate.read(filename));
    return encrypter.decrypt(encryptedContent, iv: iv);
  }

  @override
  Future<void> write(String filename, String contents) => delegate.write(filename, encrypter.encrypt(contents, iv: iv).base64);

  @override
  Future<DateTime> lastModifiedAt(String filename) => delegate.lastModifiedAt(filename);

  @override
  Future<void> clear() => delegate.clear();

  @override
  Future<List<File>> getFiles() => delegate.getFiles();
}

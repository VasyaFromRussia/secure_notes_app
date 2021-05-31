import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_notes/feature/auth/auth_model.dart';
import 'package:secure_notes/feature/notes/notes_model.dart';
import 'package:secure_notes/feature/notes/notes_model_repository.dart';
import 'package:secure_notes/feature/notes/notes_model_storage.dart';
import 'package:secure_notes/utils/di.dart';
import 'package:secure_notes/utils/io.dart';

class NotesModule implements DiModule {
  static const _encryptionKeyLength = 16;

  static const _noteDirectoryName = 'notes';

  static const _storageTitles = 'titles';
  static const _storageContents = 'contents';

  static const _extensionTitle = '.snt';
  static const _extensionContent = '.snc';

  @override
  Future<void> register(GetIt serviceLocator) async {
    serviceLocator
      ..registerLazySingletonAsync<FileStorage>(
        () => _createStorage(_extensionTitle),
        instanceName: _storageTitles,
      )
      ..registerLazySingletonAsync<FileStorage>(
        () => _createStorage(_extensionContent),
        instanceName: _storageContents,
      )
      ..registerLazySingletonAsync<NotesRepository>(() async {
        final titleStorage = await serviceLocator.getAsync<FileStorage>(instanceName: _storageTitles);
        final contentStorage = await serviceLocator.getAsync<FileStorage>(instanceName: _storageContents);
        return NotesRepositoryImpl(titleStorage: titleStorage, contentStorage: contentStorage);
      });
  }

  Future<FileStorage> _createStorage(String fileExtension) async {
    final notesDirectory = await getApplicationDocumentsDirectory().then((directory) => directory.getDirectory(_noteDirectoryName, create: true));
    final key = await inject<AuthRepository>().getKey();
    if (key == null) {
      throw 'Invalid app state: cannot access encrypted storage without key';
    }
    return EncryptedFileStorage(
      key: key.substring(0, _encryptionKeyLength),
      delegate: TypedPlainTextFileStorage(
        directory: notesDirectory,
        fileExtension: fileExtension,
      ),
    );
  }
}

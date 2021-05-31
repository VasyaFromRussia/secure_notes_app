import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:secure_notes/feature/notes/notes_model_storage.dart';
import 'package:secure_notes/utils/io.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

void main() {
  late Directory testDirectory;

  setUp(() async {
    testDirectory = await Directory.current.getDirectory('test_files', create: true);
  });

  tearDown(() async {
    if (await testDirectory.exists()) {
      await testDirectory.delete(recursive: true);
    }
  });

  group(
    'Plain text storage test',
    () {
      final testFileName = 'test_file.txt';

      test(
        'Given content, when it is written to file, then file exists on disk',
        () async {
          final storage = PlainTextFileStorage(directory: testDirectory);
          await storage.write(testFileName, 'hello');

          final expectedFile = await testDirectory.getFile(testFileName);
          await expectLater(expectedFile.exists(), completion(equals(true)));
        },
      );

      test(
        'Given content, when it is written to file, then file content can be read',
        () async {
          final expectedContent = 'Hello, storage!';
          final storage = PlainTextFileStorage(directory: testDirectory);
          await storage.write(testFileName, expectedContent);

          final actualContent = await storage.read(testFileName);
          expect(actualContent, expectedContent);
        },
      );

      test(
        'Given directory with files, when files list is requested, then the list contains all directory files',
        () async {
          final storage = PlainTextFileStorage(directory: testDirectory);
          final firstFileName = 'file_one';
          final secondFileName = 'file_two';
          await storage.write(firstFileName, '');
          await storage.write(secondFileName, '');

          final files = await storage.getFiles();
          final fileNames = files.map((e) => path.basenameWithoutExtension(e.path)).toSet();

          expect(files.length, 2);
          expect(fileNames.contains(firstFileName), true);
          expect(fileNames.contains(secondFileName), true);
        },
      );

      test(
        'Given directory with files, when clear storage, then directory is removed',
        () async {
          final storage = PlainTextFileStorage(directory: testDirectory);
          final filename = 'some_file';
          await storage.write(filename, 'contents');

          await storage.clear();

          expect(testDirectory.existsSync(), false);
        },
      );
    },
  );

  group(
    'Typed plain text storage test',
    () {
      final testFileName = 'test_file';
      final testFileExtension = '.tf';

      test(
        'Given content, when it is written to file, then file exists on disk',
        () async {
          final storage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: testFileExtension);
          await storage.write(testFileName, 'hello');

          final expectedFile = await testDirectory.getFile(testFileName + testFileExtension);
          await expectLater(expectedFile.exists(), completion(equals(true)));
        },
      );

      test(
        'Given content, when it is written to file, then file content can be read',
        () async {
          final expectedContent = 'Hello, storage!';
          final storage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: testFileExtension);
          await storage.write(testFileName, expectedContent);

          final actualContent = await storage.read(testFileName);
          expect(actualContent, expectedContent);
        },
      );

      test(
        'Given directory with files, when files list is requested, then the list contains files with valid extension',
        () async {
          final extension = '.tf';
          final typedStorage = TypedPlainTextFileStorage(directory: testDirectory, fileExtension: extension);
          final plainStorage = PlainTextFileStorage(directory: testDirectory);

          final firstValidFileName = 'file_one' + extension;
          final secondValidFileName = 'file_two' + extension;
          final firstInvalidFileName = 'file_one';
          final secondInvalidFileName = 'file_two';
          await plainStorage.write(firstValidFileName, '');
          await plainStorage.write(secondValidFileName, '');
          await plainStorage.write(firstInvalidFileName, '');
          await plainStorage.write(secondInvalidFileName, '');

          final files = await typedStorage.getFiles();
          final fileNames = files.map((e) => path.basename(e.path)).toSet();

          expect(files.length, 2);
          expect(fileNames.contains(firstValidFileName), true);
          expect(fileNames.contains(secondValidFileName), true);
          expect(fileNames.contains(firstInvalidFileName), false);
          expect(fileNames.contains(secondInvalidFileName), false);
        },
      );
    },
  );

  group(
    'Encrypted plain text storage test',
    () {
      final testFileName = 'test_file';
      final encryptingKey = Uuid().v1().substring(0, 16);

      test(
        'Given content, when it is written to file, then file exists on disk',
        () async {
          final storage = EncryptedFileStorage(
            key: encryptingKey,
            delegate: PlainTextFileStorage(directory: testDirectory),
          );
          await storage.write(testFileName, 'hello');

          final expectedFile = await testDirectory.getFile(testFileName);
          await expectLater(expectedFile.exists(), completion(equals(true)));
        },
      );

      test(
        'Given content, when it is written to file, then content is encrypted and does not match original string',
        () async {
          final expectedContent = 'Hello, storage!';
          final storage = EncryptedFileStorage(
            key: encryptingKey,
            delegate: PlainTextFileStorage(directory: testDirectory),
          );
          await storage.write(testFileName, expectedContent);

          final actualContent = await PlainTextFileStorage(directory: testDirectory).read(testFileName);
          expect(actualContent, isNot(equals(expectedContent)));
        },
      );

      test(
        'Given content, when it is written to file, then content is decrypted correctly on reading',
        () async {
          final expectedContent = 'Hello, storage!';
          final storage = EncryptedFileStorage(
            key: encryptingKey,
            delegate: PlainTextFileStorage(directory: testDirectory),
          );
          await storage.write(testFileName, expectedContent);

          final actualContent = await storage.read(testFileName);
          expect(actualContent, expectedContent);
        },
      );
    },
  );
}

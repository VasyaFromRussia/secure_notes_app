import 'dart:io';

extension DirectoryExtension on Directory {
  Future<File> getFile(String filename, {bool create = false}) async {
    final file = File('$path${Platform.pathSeparator}$filename');
    if (create && !(await file.exists())) {
      await file.create();
    }
    return file;
  }

  Future<Directory> getDirectory(String name, {bool create = false}) async {
    final directory = Directory('$path${Platform.pathSeparator}$name');
    if (create && !(await directory.exists())) {
      await directory.create(recursive: true);
    }
    return directory;
  }
}

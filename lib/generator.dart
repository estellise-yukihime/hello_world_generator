
// This class contains a method
// that can generate a file base on the template
import 'dart:io';

class FileSourceException implements Exception {
  const FileSourceException([this.message = '']);

  final String message;

  @override
  String toString(){
    return 'File Source Exception: $message';
  }
}

class FileTargetException implements Exception {
  const FileTargetException([this.message = '']);

  final String message;

  @override
  String toString(){
    return 'File Target Exception: $message';
  }
}

abstract class Generator {
  const Generator();

  String get source {
    return '';
  }

  String get target {
    return '';
  }

  Future<void> generate() async {
    if (source.isEmpty) {
      throw FileSourceException('Expected valid source path');
    }

    if (target.isEmpty) {
      throw FileTargetException('Expected valid target path');
    }

    final file = File(source);

    await file.copy(target);
  }
}

import 'dart:io';

import 'package:hello_word_generator/generator.dart';

const languages = [
  'html',
  'javascript',
  'c#',
  'php',
  'java',
  'python',
  'go',
  'ruby',
  'kotlin',
];

const languagesExtension = {
  'html': 'html',
  'javascript': 'js',
  'c#': 'cs',
  'php': 'php',
  'java': 'java',
  'python': 'py',
  'go': 'go',
  'ruby': 'rb',
  'kotlin': 'kt',
};

const template = {
  'html': 'helloworld.html',
  'javascript': 'helloworld.js',
  'c#': 'helloworld.cs',
  'php': 'helloworld.php',
  'java': 'helloworld.java',
  'python': 'helloworld.py',
  'go': 'helloworld.go',
  'ruby': 'helloworld.rb',
  'kotlin': 'helloworld.kt',
};

class HelloWorld extends Generator{
  HelloWorld.generate({required this.language, required this.destination}) {
      if (!languages.contains(language)){
        throw UnsupportedError('Language not supported.');
      }

      if (template[language] == null){
        throw UnsupportedError('Template not found.');
      }

      if (target.isEmpty || Directory(destination).existsSync()) {
        throw UnsupportedError('Destination is not a valid path');
      }
  }

  final String language;
  final String destination;

  @override
  String get source{
    return '${Directory.current.path}/assets/template/${template[language]}';
  }

  @override
  String get target{
    return destination;
  }
}
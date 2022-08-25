
import 'package:hello_word_generator/helloworld.dart';

void main(List<String> arguments) {
  try{
    if ((arguments.length != 1 && arguments.length != 2)){
      showUsage();
    }

    if (arguments.length == 1) {
      final command = arguments[0];
      final commandLower = command.toLowerCase();

      if (commandLower == '-h' || commandLower == '--help') {
        showHelp();
      } else {
        showUsage();
      }
    }

    if (arguments.length == 2) {
      // argument is 2
      final language = arguments[0];
      final target = arguments[1];

      final hello = HelloWorld.generate(language: language, destination: target);
      
      hello.generate();
    }
  } catch (e) {
    print(e);
  }
}

void showUsage(){
  print('<path to executable> -h');
}

void showHelp(){
  print('usage: <path to executable> <language> <file_destination.file_name.<language extension>>');
  print('');
  print('supported language:');
  
  for (final language in languages){
    print('\t$language.${languagesExtension[language]}');
  }
  
  print('');
  print('This CLI will help you generate Hello World on your favorite supported languages.');
}
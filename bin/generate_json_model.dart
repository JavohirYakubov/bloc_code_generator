import 'dart:io';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart generate_json_model.dart <ClassName>');
    exit(1);
  }

  final className = arguments[0];

  final scriptDir = p.dirname(Platform.script.toFilePath());
  final templatesDir = p.join(scriptDir, '..', 'templates');

  final templatePath = p.join(templatesDir, 'model_template.mustache');
  final templateContent = File(templatePath).readAsStringSync();
  final template = Template(templateContent);

  final output = template.renderString({'className': className});
  final fileName = _classNameToFileName(className);

  final outputPath = p.join('$fileName.dart');
  File(outputPath).writeAsStringSync(output);

  print('Generated ${outputPath}');
}

String _classNameToFileName(String className) {
  String fileName = '';
  for (int i = 0; i < className.length; i++) {
    if (className[i] == className[i].toUpperCase()) {
      fileName += '_${className[i].toLowerCase()}';
    } else {
      fileName += className[i];
    }
  }
  return fileName
      .substring(1); // Remove leading underscore from the first character
}

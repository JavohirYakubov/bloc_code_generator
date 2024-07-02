import 'dart:io';
import 'package:mustache_template/mustache_template.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart generate.dart <ClassName>');
    exit(1);
  }
  print("Step 1");
  final className = arguments[0];
  print("Step 2");
  final templates = {
    'state': 'state_template.mustache',
    'bloc': 'bloc_template.mustache',
    'page': 'page_template.mustache',
    'event': 'event_template.mustache',
  };

  final scriptDir = p.dirname(Platform.script.toFilePath());

  final templatesDir = p.join(scriptDir, '..', 'templates');

  // Define the output directory path based on the class name
  final outputDir = p.join(Directory.current.path, className.toLowerCase());

  // Ensure the output directory exists, create if it doesn't
  Directory(outputDir).createSync(recursive: true);

  templates.forEach((type, templateName) {
    final templatePath = p.join(templatesDir, templateName);
    final templateContent = File(templatePath).readAsStringSync();
    final template = Template(templateContent);

    final output = template.renderString({'className': className});

    final outputPath =
        p.join(outputDir, '${className.toLowerCase()}_$type.dart');
    File(outputPath).writeAsStringSync(output);

    print('Generated ${outputPath}');
  });
}

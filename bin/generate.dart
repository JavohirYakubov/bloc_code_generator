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

  // Find the directory of the current script
  final scriptDir = p.dirname(Platform.script.toFilePath());

  final templatesDir = p.join(scriptDir, '..', 'templates');

  templates.forEach((type, templateName) {
    final templatePath = p.join(templatesDir, templateName);
    final templateContent = File(templatePath).readAsStringSync();
    final template = Template(templateContent);

    final currentDirectory = Directory.current.path;

    final output = template.renderString({
      'className': className,
    });

    final outputPath =
        p.join(currentDirectory, '${className.toLowerCase()}_$type.dart');
    File(outputPath).writeAsStringSync(output);

    print('Generated ${outputPath}');
  });

  print("Step 3");
}

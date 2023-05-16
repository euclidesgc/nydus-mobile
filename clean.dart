// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:isolate';

void main() async {
  final rootDir = Directory.current;

  await _removePubspecLockForPackages(rootDir);
  await _runCommandForPackages(rootDir, 'flutter', ['clean']);
  await _runCommandForPackages(rootDir, 'flutter', ['pub', 'get']);
}

Future<void> _removePubspecLockForPackages(Directory directory) async {
  final packageList = _findPackages(directory);

  final futures = <Future<void>>[];

  for (final package in packageList) {
    final packageDir = Directory(package);
    futures.add(_removePubspecLock(packageDir));
  }

  await Future.wait(futures);
}

Future<void> _removePubspecLock(Directory directory) async {
  final pubspecLockFile = File('${directory.path}/pubspec.lock');

  if (await pubspecLockFile.exists()) {
    await pubspecLockFile.delete();
  }
}

Future<void> _runCommandForPackages(
    Directory directory, String command, List<String> arguments) async {
  final packageList = _findPackages(directory);

  final futures = <Future<void>>[];

  for (final package in packageList) {
    final packageDir = Directory(package);
    futures.add(_runCommand(packageDir, command, arguments));
  }

  await Future.wait(futures);
}

Future<void> _runCommand(
    Directory directory, String command, List<String> arguments) async {
  print('⏩️ Running "$command ${arguments.join(' ')}" in ${directory.path}');

  final receivePort = ReceivePort();

  await Isolate.spawn(_runCommandInIsolate, {
    'command': command,
    'arguments': arguments,
    'workingDirectory': directory.path,
    'sendPort': receivePort.sendPort,
  });

  await receivePort.first;

  print('✅ Command completed successfully!');
}

void _runCommandInIsolate(dynamic message) {
  final command = message['command'];
  final arguments = message['arguments'];
  final workingDirectory = message['workingDirectory'];
  final sendPort = message['sendPort'];

  Process.run(command, arguments, workingDirectory: workingDirectory)
      .then((result) {
    if (result.exitCode != 0) {
      print(
          '🛑 Failed to run command: $command ${arguments.join(' ')} in $workingDirectory');
      print(result.stderr);
      exitCode = result.exitCode;
    } else {
      sendPort.send(null);
    }
  });
}

List<String> _findPackages(Directory directory) {
  final pubspecFiles =
      directory.listSync(recursive: true, followLinks: false).where((entity) {
    return entity is File && entity.path.endsWith('pubspec.yaml');
  }).toList();

  final packages = <String>{};
  for (final file in pubspecFiles) {
    final packageDir = file.parent.path;
    packages.add(packageDir);
  }

  return packages.toList();
}

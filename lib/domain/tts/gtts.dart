import 'dart:io';

import 'package:dr_zyggy/domain/util/unzip.dart';
import 'package:dr_zyggy/domain/tts/tts.dart';
import 'package:dr_zyggy/domain/util/copy.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class Gtts extends Tts {
  // singleton ----------------------------------------
  static final Gtts _instance = Gtts._internal();
  Gtts._internal();
  factory Gtts() {
    return _instance;
  }
  // << -----------------------------------------------

  @override
  Future<void> init() async {
    await _unzipTtsFile();

    final scriptPath = await _getScriptPath();
    try {
      await Process.run('chmod', ['+x', scriptPath]);
    } catch (e) {
      debugPrint('failed to run script $e');
    }
  }

  Process? _process;
  final List<int> _pidList = [];

  @override
  Future<void> speak(String text) async {
    final scriptDir = await _getScriptDir();
    final scriptPath = await _getScriptPath();

    try {
      await _stop();
      _process = await Process.start(
        scriptPath,
        [text],
        workingDirectory: scriptDir,
      );

      final pid = _process?.pid;
      if (pid != null) {
        _pidList.add(pid);
      }

      _process?.stdout.listen((data) {
        debugPrint('STDOUT: ${String.fromCharCodes(data)}');
      });
    } catch (e) {
      debugPrint('failed to run script $e');
    }
  }

  @override
  Future<void> terminate() async {
    for (var pid in _pidList) {
      Process.killPid(pid);
    }
  }

  Future<void> stop() async {
    await _stop();
  }

  Future<void> _stop() async {
    try {
      _process?.kill();
      debugPrint("Process was canceled.");
    } catch (e) {
      debugPrint("Failed to cancel process: $e");
    }
  }

  Future<void> _unzipTtsFile() async {
    await copyAssetsToDocument('assets/gtts/tts.zip', 'dr_zyggy/gtts/tts.zip');

    final documentDir = await getApplicationDocumentsDirectory();
    final gttsDir = File(p.join(documentDir.path, 'dr_zyggy', 'gtts'));
    final zipFilePath = File(p.join(gttsDir.path, 'tts.zip'));

    await unzipFile(zipFilePath.path, gttsDir.path);
    await zipFilePath.delete();
  }

  Future<String> _getScriptPath() async {
    final scriptDir = await _getScriptDir();
    final scriptPath = File(p.join(
      scriptDir,
      'generate_bn_speech.sh',
    ));
    return scriptPath.path;
  }

  Future<String> _getScriptDir() async {
    final documentDir = await getApplicationDocumentsDirectory();
    final scriptPath = File(p.join(
      documentDir.path,
      'dr_zyggy',
      'gtts',
      'tts',
    ));
    return scriptPath.path;
  }
}

import 'dart:io';

import 'package:dr_zyggy/domain/tts/tts.dart';
import 'package:dr_zyggy/domain/util/copy.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sherpa_onnx/sherpa_onnx.dart' as sherpa_onnx;

class SherpaTts extends Tts {
  final _speed = 1.0;
  final _sid = 0;
  late sherpa_onnx.OfflineTts _tts;

  @override
  Future<void> speak(String text) async {
    final ttsDir = await _getBnTtsDir();
    final outputWav = File(p.join(ttsDir.path, 'tts_bn_output.wav'));

    final audio = _tts.generate(
      text: text,
      sid: _sid,
      speed: _speed,
    );
    debugPrint('audio generated');
    _tts.free();
    debugPrint('tts freed');

    final success = sherpa_onnx.writeWave(
      filename: outputWav.path,
      samples: audio.samples,
      sampleRate: audio.sampleRate,
    );
    debugPrint('file written to ${outputWav.path} successfully: $success');
  }

  @override
  Future<void> stop() async {
    _tts.free();
  }

  @override
  Future<void> init() async {
    final ttsDir = await _getBnTtsDir();

    final model = File(p.join(ttsDir.path, 'model.onnx'));
    final tokens = File(p.join(ttsDir.path, 'tokens.txt'));

    await model.parent.create(recursive: true);

    await copyAssetsToDocument(
      'assets/tts/model/bn/model.onnx',
      'dr_zyggy/tts/model/bn/model.onnx',
    );

    await copyAssetsToDocument(
      'assets/tts/model/bn/tokens.txt',
      'dr_zyggy/tts/model/bn/tokens.txt',
    );

    sherpa_onnx.initBindings();

    final vits = sherpa_onnx.OfflineTtsVitsModelConfig(
      model: model.path,
      tokens: tokens.path,
    );

    final modelConfig = sherpa_onnx.OfflineTtsModelConfig(
      vits: vits,
      numThreads: 2,
      provider: 'cpu',
      debug: false,
    );

    final config = sherpa_onnx.OfflineTtsConfig(
      model: modelConfig,
      maxNumSenetences: 1,
    );

    debugPrint('tts before creating');
    try {
      _tts = sherpa_onnx.OfflineTts(config);
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('tts initialized');
  }

  Future<File> _getBnTtsDir() async {
    final documentDir = await getApplicationDocumentsDirectory();
    final appDir = File(p.join(documentDir.path, 'dr_zyggy'));
    final ttsDir = File(p.join(appDir.path, 'tts'));
    final langDir = File(p.join(ttsDir.path, 'bn'));

    return langDir;
  }

  @override
  Future<void> terminate() async {
    // no op
  }
}

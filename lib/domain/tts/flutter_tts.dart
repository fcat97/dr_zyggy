import 'package:dr_zyggy/domain/tts/tts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FlutterTtsWrapper extends Tts {
  late FlutterTts tts;

  @override
  Future<void> init() async {
    tts = FlutterTts();
    debugPrint("is bn available ${await tts.isLanguageAvailable('hi')}");
    await tts.setLanguage('hi');
  }

  @override
  Future<void> speak(String text) async {
    await tts.speak(text);
  }

  @override
  Future<void> terminate() async {
    await tts.stop();
  }

  @override
  Future<void> stop() async {
    await tts.stop();
  }
}

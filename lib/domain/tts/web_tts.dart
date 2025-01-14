import 'package:dr_zyggy/domain/tts/tts.dart';
import 'dart:html' as html;

class WebTts extends Tts {
  @override
  Future<void> init() async {
    // no need
  }

  @override
  Future<void> speak(String text) async {
    // Check if SpeechSynthesis is available in the browser
    if (html.window.speechSynthesis != null) {
      // Create a new SpeechSynthesisUtterance instance
      final speech = html.SpeechSynthesisUtterance(text);
      speech.lang = "hi";

      // Optionally set properties for the speech (like pitch and rate)
      speech.pitch = 1.0; // normal pitch
      speech.rate = 1.0; // normal speed

      // Speak the text
      html.window.speechSynthesis?.speak(speech);
    } else {
      print("Speech Synthesis is not supported in this browser.");
    }
  }

  @override
  Future<void> stop() async {
    // TODO: implement stop
  }

  @override
  Future<void> terminate() async {
    // TODO: implement terminate
  }
}

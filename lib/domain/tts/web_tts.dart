import 'package:dr_zyggy/domain/tts/tts.dart';
import 'dart:html' as html;

import 'package:flutter/rendering.dart';


class WebTts extends Tts {
  html.SpeechSynthesisVoice? _bnVoice;
  html.SpeechSynthesis? _speechSynthesis;

  @override
  Future<void> init() async {
    if (html.window.speechSynthesis != null) {
      _speechSynthesis = html.window.speechSynthesis;

      _speechSynthesis?.getVoices().forEach((voice) => _findAndSetBnVoice(voice));
    }
  }

  void _findAndSetBnVoice(html.SpeechSynthesisVoice voice) {
    final name = voice.name;
    if (name == null) {
      return;
    }
    debugPrint(name);
    if (name.toLowerCase().contains("bangla")) {
      _bnVoice = voice;
    }
  }

  @override
  Future<void> speak(String text) async {
    // Check if SpeechSynthesis is available in the browser
    if (_speechSynthesis != null) {
      // Create a new SpeechSynthesisUtterance instance
      final speech = html.SpeechSynthesisUtterance(text);
      if (_bnVoice != null) {
        speech.voice = _bnVoice;
      }

      // Optionally set properties for the speech (like pitch and rate)
      speech.pitch = 1.0; // normal pitch
      speech.rate = 1.0; // normal speed

      // Speak the text
      _speechSynthesis?.speak(speech);
    } else {
      print("Speech Synthesis is not supported in this browser.");
    }
  }

  @override
  Future<void> stop() async {
    // todo
  }

  @override
  Future<void> terminate() async {
    // TODO: implement terminate
  }
}

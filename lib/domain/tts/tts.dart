abstract class Tts {
  Future<void> init();
  Future<void> speak(String text);
  Future<void> stop();
  Future<void> terminate();
}

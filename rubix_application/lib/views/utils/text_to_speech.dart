// call TTS function using below syntax
// await TextToSpeech.speakText("Hello, Flutter!");

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  late FlutterTts _flutterTts;

  TextToSpeech() {
    _flutterTts = FlutterTts();
  }

  static const double NormalSpeechSpeed = 0.2;
  static const double SlowSpeechSpeed = 0.05;

  Future<void> speak(String text, {double rate = NormalSpeechSpeed}) async {
    await _flutterTts.setLanguage('hi-IN');
    print(rate);
    _flutterTts.setSpeechRate(rate);
    await _flutterTts.speak(text);
  }

  static Future<void> speakText(String text, {double rate = 0.5}) async {
    print(rate);
    final textToSpeech = TextToSpeech();
    await textToSpeech.speak(text, rate: rate);
  }
}

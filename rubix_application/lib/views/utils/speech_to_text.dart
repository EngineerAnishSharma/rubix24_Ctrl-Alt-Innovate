import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText {
  late stt.SpeechToText _speech;

  SpeechToText() {
    _speech = stt.SpeechToText();
  }

  // Getter for _speech
  stt.SpeechToText get speech => _speech;

  Future<String> listen() async {
    String result = "";

    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );

    if (available) {
      await _speech.listen(
        onResult: (val) => result = val.recognizedWords,
      );
      print(result);
    } else {
      print("The user has denied the use of speech recognition.");
    }

    return result;
  }

  static Future<String> listenText() async {
    final speechToText = SpeechToText();
    return await speechToText.listen();
  }
}

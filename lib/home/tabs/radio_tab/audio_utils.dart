import 'package:just_audio/just_audio.dart';

class AudioUtils {
  static final player = AudioPlayer();

  static Future<void> playRadio(String url) async {
    if (player.playing) {
      await player.stop();
    }
    try {
      await player.setUrl(url);
      player.play();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> stopRadio() async {
    if (player.playing) {
      await player.stop();
    }
  }
}

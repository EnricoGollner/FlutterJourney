import 'package:share_plus/share_plus.dart';

class ShareController {
  static void shareGif({required String gifUrl}) {
    Share.share("Veja este Gif que encontrei: $gifUrl");
  }
}

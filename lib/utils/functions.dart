import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../global/variables.dart';

class UtilsFunctions {
  Future<void> createSession() async {
    var response = await GlobalsVariables.api.createSession();
    if (response != null) {
      GlobalsVariables.sessionId = response;
    }
  }

  // void loadingPadrao() {
  //   Get.dialog(
  //     Loading(),
  //     transitionDuration: Duration.zero,
  //     barrierDismissible: false,
  //   );
  // }

  static String getMD5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}

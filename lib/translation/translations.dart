import 'package:i18n_extension/i18n_extension.dart';

const appTitle = "appTitle";

extension Localization on String {
  static const _t = Translations.from("en_us", {
    appTitle: {
      "en_us": "World of Paladins",
      "pt_br": "Mundo de Paladins",
    }
  });

  String get i18n => localize(this, _t);
}

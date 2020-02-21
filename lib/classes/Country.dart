import 'package:world_info/classes/Continent.dart';
import 'package:world_info/classes/Language.dart';
import 'package:world_info/classes/State.dart';

class Country {
  String code;
  String name;
  String native;
  String phone;
  Continent continent;
  String currency;
  List<Language> languages;
  String emoji;
  String emojiU;
  List<State> states;

  Country.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        name = json["name"],
        native = json["native"],
        phone = json["phone"],
        currency = json["currency"],
        emoji = json["emoji"],
        emojiU = json["emojiU"];

  static get query => r"""
  {
    continent(code: \$code) {
      countries {
        name
      }
    }
  }
  """;
}

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
}

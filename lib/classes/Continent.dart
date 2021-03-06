import 'package:world_info/classes/Country.dart';

class Continent {
  String code;
  String name;
  List<Country> countries;

  Continent.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        name = json["name"];

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "name": name,
    };
  }

  static get query => r"""
  {
    continents {
      name
      code
    }
  }
  """;
}

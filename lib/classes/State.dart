import 'package:world_info/classes/Country.dart';

class CountryState {
  String code;
  String name;
  Country country;

  CountryState.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        name = json["name"];

  Map<String, dynamic> toJson() => {"code": code, "name": name};
}

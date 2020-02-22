class Language {
  String code;
  String name;
  String native;
  int rtl;

  Language.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        name = json["name"],
        native = json["native"],
        rtl = json["rtl"];

  toJson() {
    return {
      "code": code,
      "name": name,
      "native": native,
      "rtl": rtl,
    };
  }
}

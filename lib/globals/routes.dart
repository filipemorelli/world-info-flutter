import 'package:flutter/material.dart';
import 'package:world_info/pages/home/home_screen.dart';
import 'package:world_info/pages/not_found/not_found_screen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "home":
      return MaterialPageRoute(
          builder: (_) => HomeScreen(), settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}

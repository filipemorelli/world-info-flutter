import 'package:flutter/material.dart';
import 'package:world_info/pages/continent/continent_screen.dart';
import 'package:world_info/pages/country/country_scree.dart';
import 'package:world_info/pages/not_found/not_found_screen.dart';
import 'package:world_info/pages/states/states_screen.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case "continents":
      return MaterialPageRoute(
          builder: (_) => ContinentScreen(), settings: settings);
      break;
    case "countries":
      return MaterialPageRoute(
          builder: (_) => CountryScreen(continent: settings.arguments),
          settings: settings);
      break;
    case "states":
      return MaterialPageRoute(
          builder: (_) => StateScreen(country: settings.arguments),
          settings: settings);
      break;
    default:
      return MaterialPageRoute(
          builder: (_) => NotFoundScreen(), settings: settings);
  }
}

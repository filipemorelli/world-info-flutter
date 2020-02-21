import 'package:flutter/material.dart';
import 'package:world_info/globals/constants.dart';
import 'package:world_info/globals/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      showPerformanceOverlay: showSemanticsDebugger,
      initialRoute: "home",
      onGenerateRoute: onGeneratedRoutes,
    );
  }
}

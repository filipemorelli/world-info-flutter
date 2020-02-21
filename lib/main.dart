import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:world_info/blocs/graphql_bloc.dart';
import 'package:world_info/globals/constants.dart';
import 'package:world_info/globals/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    GraphqlBloc();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FIXME: Ajustar error de exception inicial
    return GraphQLProvider(
      client: GraphqlBloc.instance.client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            splashColor: Colors.indigo,
          ),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          showPerformanceOverlay: showSemanticsDebugger,
          initialRoute: "continents",
          onGenerateRoute: onGeneratedRoutes,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:world_info/classes/Continent.dart';
import 'package:world_info/classes/Country.dart';

class CountryScreen extends StatefulWidget {
  Continent continent;

  CountryScreen({@required this.continent});

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(widget.continent.queryGetCountries),
      ),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.data == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.continent.name),
              centerTitle: true,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        List<Country> countries = List<Map<String, dynamic>>.from(
                result.data["continent"]["countries"])
            .map((country) => Country.fromJson(country))
            .toList();
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.continent.name),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (BuildContext ctx, int i) {
              return ListTile(
                leading: Text(
                  countries[i].emoji,
                  style: TextStyle(fontSize: 36),
                ),
                title: Text(countries[i].name),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              );
            },
          ),
        );
      },
    );
  }
}

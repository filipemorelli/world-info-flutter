import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:world_info/classes/Continent.dart';

class ContinentScreen extends StatefulWidget {
  @override
  _ContinentScreenState createState() => _ContinentScreenState();
}

class _ContinentScreenState extends State<ContinentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Continent GraphQL"),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: ContinentList(),
      ),
    );
  }
}

class ContinentList extends StatelessWidget {
  const ContinentList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(documentNode: gql(Continent.query)),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.hasException) {
          return Text("Não conseguiu Buscar os Dados do server");
        }
        if (result.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        List<Continent> continents =
            List<Map<String, dynamic>>.from(result.data["continents"])
                .map((continent) => Continent.fromJson(continent))
                .toList();
        return ListView.builder(
          itemCount: continents.length,
          itemBuilder: (BuildContext ctx, int i) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(continents[i].code),
                foregroundColor: Colors.indigo,
              ),
              title: Text(continents[i].name),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "countries",
                    arguments: continents[i].code);
              },
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:world_info/classes/Country.dart';
import 'package:world_info/classes/State.dart';

class StateScreen extends StatefulWidget {
  final Country country;

  StateScreen({@required this.country});

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.country.name),
      ),
      body: SafeArea(
        bottom: false,
        child: Query(
          options: QueryOptions(
            documentNode: gql(widget.country.queryGetStates),
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.data == null) {
              return Center(child: CircularProgressIndicator());
            }

            List<CountryState> states = List<Map<String, dynamic>>.from(
                    result.data["country"]["states"])
                .map((state) => CountryState.fromJson(state))
                .toList();
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  buildContryInformation(),
                  ...buildStatesList(states)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> buildStatesList(List<CountryState> states) {
    return states.length > 0
        ? states.map((state) {
            return ListTile(
              leading: state.code != null
                  ? CircleAvatar(
                      child: Text(state.code),
                      foregroundColor: Colors.indigo,
                    )
                  : null,
              title: Text(state.name),
            );
          }).toList()
        : [ListTile(title: Text("Not Found States"))];
  }

  Widget buildContryInformation() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildFlagCountry(),
          buildCountryDetails(),
        ],
      ),
    );
  }

  Widget buildFlagCountry() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: CircleAvatar(
        radius: 45,
        foregroundColor: Colors.indigo.shade400,
        child: Hero(
          tag: widget.country.emoji,
          child: Text(
            widget.country.emoji,
            style: TextStyle(fontSize: 72),
          ),
        ),
      ),
    );
  }

  Widget buildCountryDetails() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Native: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(widget.country.native),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "Phone Prefix: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(widget.country.phone),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "Country code: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(widget.country.code),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "Currency: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(widget.country.currency),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              widget.country.speakLanguages,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

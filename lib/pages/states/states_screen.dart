import 'package:flutter/material.dart';
import 'package:world_info/classes/Country.dart';

class StateScreen extends StatefulWidget {
  Country country;

  StateScreen({@required this.country});

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.country.languages[0].toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.country.name),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      widget.country.emoji,
                      style: TextStyle(fontSize: 72),
                    ),
                    Text(widget.country.name),
                    Text(widget.country.native),
                    Text(widget.country.phone),
                    Text(widget.country.code),
                    Text(widget.country.languages
                        .map((language) => language.name)
                        .toList()
                        .join(", ")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

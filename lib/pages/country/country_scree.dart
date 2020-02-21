import 'package:flutter/material.dart';
import 'package:world_info/classes/Country.dart';

class CountryScreen extends StatefulWidget {
  String code;

  CountryScreen({@required this.code});

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.code),
        centerTitle: true,
      ),
      body: Center(
        child: Text(widget.code),
      ),
    );
  }
}

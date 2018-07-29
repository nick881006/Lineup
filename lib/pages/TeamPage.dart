import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  final String title;

  TeamPage({Key key, this.title}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.title),
    );
  }
}

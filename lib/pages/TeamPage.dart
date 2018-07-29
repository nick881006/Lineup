import 'package:flutter/material.dart';
import 'package:lineup/widgets/Background.dart';

class TeamPage extends StatefulWidget {
  final String title;

  TeamPage({Key key, this.title}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        BackgroundWidget(
          imagePath: 'images/background.png',
        ),
        Center(
          child: Text(widget.title),
        )
      ]
    );
  }
}

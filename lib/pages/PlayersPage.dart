import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/CommonTools.dart';
import 'package:Lineup11/widgets/Background.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: Tools.cupertinoCloseButtonBuilder(context, 'Close'),
        middle: Text('Players'),
        trailing: Tools.cupertinoButtonBuilder(context, 'Add', '/PlayerDetailPage'),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background2.png',
          ),
          Center(
            child: Text('Player'),
          ),
        ],
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/CommonTools.dart';
import 'package:Lineup11/widgets/Background.dart';

class PlayerDetailPage extends StatefulWidget {
  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: Tools.cupertinoCloseButtonBuilder(context, 'Cancel'),
        middle: Text('Player Detail'),
        trailing: CupertinoButton(
            child: Text('Save'),
            onPressed: () {}),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background2.png',
          ),
          Center(
            child: Text('Player Detail'),
          ),
        ],
      )
    );
  }
}

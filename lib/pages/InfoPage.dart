import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/CommonTools.dart';
import 'package:Lineup11/widgets/Background.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: Tools.cupertinoCloseButtonBuilder(context, 'Close'),
        middle: Text('Info'),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background2.png',
          ),
          Center(
            child: Text('Info'),
          ),
        ],
      )
    );
  }
}

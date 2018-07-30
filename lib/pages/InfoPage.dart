import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/widgets/Background.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: CupertinoButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            }),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/widgets/Background.dart';

class PlayerDetailPage extends StatefulWidget {
  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: CupertinoButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        middle: Text('Player Detail'),
        trailing: CupertinoButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
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

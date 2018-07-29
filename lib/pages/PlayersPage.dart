import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/pages/PlayerDetailPage.dart';
import 'package:lineup/widgets/Background.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: CupertinoButton(
            child: Text(
              'Close',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        middle: Text('Players'),
        trailing: CupertinoButton(
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayerDetailPage())
              );
            }),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/pages/InfoPage.dart';
import 'package:lineup/pages/PlayerDetailPage.dart';
import 'package:lineup/pages/PlayersPage.dart';
import 'package:lineup/pages/TeamPage.dart';

void main() {
  runApp(new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/TeamPage': (BuildContext context) => new TeamPage(),
        '/PlayerPage': (BuildContext context) => new PlayerPage(),
        '/PlayerDetailPage': (BuildContext context) => new PlayerDetailPage(),
        '/InfoPage': (BuildContext context) => new InfoPage(),
      },
      home: new TeamPage(),
    )
  );
}
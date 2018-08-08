import 'dart:async';
import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/utils/Database.dart';
import 'package:Lineup11/widgets/Background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/pages/InfoPage.dart';
import 'package:Lineup11/pages/PlayerDetailPage.dart';
import 'package:Lineup11/pages/PlayersPage.dart';
import 'package:Lineup11/pages/TeamPage.dart';

void main() {
  runApp(LineupApp());
}

class LineupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>{
        '/TeamPage': (BuildContext context) => new TeamPage(),
        '/PlayerPage': (BuildContext context) => new PlayerPage(),
        '/PlayerDetailPage': (BuildContext context) => new PlayerDetailPage(),
        '/InfoPage': (BuildContext context) => new InfoPage(),
      },
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool initialized = false;

  Future<List<Person>> fetchPersonList() async{
    PersonDatabase.get().init();
//    PersonDatabase.get().deleteRecords();

    Future<List<Person>> persons = PersonDatabase.get().getPersonsFromDatabase();

    return persons;
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {

      return TeamPage();
    } else {
      return FutureBuilder<List<Person>>(
        future: fetchPersonList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PersonDatabase.get().initTeams(snapshot.data);
            initialized = true;

            return TeamPage();
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return LaunchScreen();
          } else {
            return LaunchScreen();
          }
        },
      );
    }
  }
}

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      imagePath: 'images/LaunchImage.png',
    );
  }
}

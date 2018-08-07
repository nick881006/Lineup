import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/utils/Database.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/Constants.dart';
import 'package:Lineup11/widgets/Background.dart';
import 'package:Lineup11/widgets/ManagerWidget.dart';
import 'package:Lineup11/widgets/PlayerWidget.dart';

class FieldWidget extends StatefulWidget {
  final String title;
  final double appBarHeight;
  final double tabBarHeight;
  final double statusBarHeight;

  const FieldWidget({Key key, this.title, this.appBarHeight, this.tabBarHeight, this.statusBarHeight}) : super(key: key);

  @override
  _FieldWidgetState createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  PlayerWidget createPlayer(int id, double x, double y) {
    return PlayerWidget(
      id: id,
      offset: Offset(x, y),
      appBarHeight: widget.appBarHeight,
      tabBarHeight: widget.tabBarHeight,
      statusBarHeight: widget.statusBarHeight,
    );
  }

  List<PlayerWidget> loadPlayers(double height, double width){
    double fieldHeight = height - widget.statusBarHeight - widget.appBarHeight - widget.tabBarHeight;
    double fieldMarginTB = fieldHeight * Constants.fieldTBRatio;
    double pitchHeight = fieldHeight - fieldMarginTB;
    double tempHeight = height - height * Constants.fieldTBRatio - widget.statusBarHeight - Constants.widgetSize;

    List<PlayerWidget> players = new List();
    List<Person> team = widget.title == 'Main'? PersonDatabase.get().main : PersonDatabase.get().sub;

    // first time, create db records
    if (team[0] == null) {
      // initialize default pos
      // GK
      players.add(createPlayer(widget.title == 'Main'? 0 : 11, calculateWidth(1/2, Constants.widgetSize / 2, width), tempHeight + Constants.widgetSize / 2));
      // DF
      players.add(createPlayer(widget.title == 'Main'? 1 : 12, calculateWidth(0.1, 0.0, width), tempHeight - pitchHeight * 0.27));
      players.add(createPlayer(widget.title == 'Main'? 2 : 13, calculateWidth(0.9, Constants.widgetSize, width), tempHeight - pitchHeight * 0.27));
      players.add(createPlayer(widget.title == 'Main'? 3 : 14, calculateWidth(0.3, 0.0, width), tempHeight - pitchHeight * 0.2));
      players.add(createPlayer(widget.title == 'Main'? 4 : 15, calculateWidth(0.7, Constants.widgetSize, width), tempHeight - pitchHeight * 0.2));

      // MF
      players.add(createPlayer(widget.title == 'Main'? 5 : 16, calculateWidth(0.1, 0.0, width), tempHeight - pitchHeight * 0.5));
      players.add(createPlayer(widget.title == 'Main'? 6 : 17, calculateWidth(0.9, Constants.widgetSize, width), tempHeight - pitchHeight * 0.5));
      players.add(createPlayer(widget.title == 'Main'? 7 : 18, calculateWidth(0.3, 0.0, width), tempHeight - pitchHeight * 0.5));
      players.add(createPlayer(widget.title == 'Main'? 8 : 19, calculateWidth(0.7, Constants.widgetSize, width), tempHeight - pitchHeight * 0.5));

      // FW
      players.add(createPlayer(widget.title == 'Main'? 9 : 20, calculateWidth(0.3, 0.0, width), tempHeight - pitchHeight * 0.75));
      players.add(createPlayer(widget.title == 'Main'? 10 : 21, calculateWidth(0.7, Constants.widgetSize, width), tempHeight - pitchHeight * 0.75));

      // initialize in database
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 0 : 11, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(1/2, Constants.widgetSize / 2, width), y: tempHeight + Constants.widgetSize / 2));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 1 : 12, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.1, 0.0, width), y: tempHeight - pitchHeight * 0.27));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 2 : 13, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.9, Constants.widgetSize, width), y: tempHeight - pitchHeight * 0.27));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 3 : 14, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.3, 0.0, width), y: tempHeight - pitchHeight * 0.2));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 4 : 15, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.7, Constants.widgetSize, width), y: tempHeight - pitchHeight * 0.2));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 5 : 16, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.1, 0.0, width), y: tempHeight - pitchHeight * 0.5));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 6 : 17, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.9, Constants.widgetSize, width), y: tempHeight - pitchHeight * 0.5));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 7 : 18, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.3, 0.0, width), y: tempHeight - pitchHeight * 0.5));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 8 : 19, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.7, Constants.widgetSize, width), y: tempHeight - pitchHeight * 0.5));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 9 : 20, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.3, 0.0, width), y: tempHeight - pitchHeight * 0.75));
      PersonDatabase.get().updatePersonInDatabase(Person(id: widget.title == 'Main'? 10 : 21, role: widget.title.toLowerCase(), number: -1, name: '-', image: null, x: calculateWidth(0.7, Constants.widgetSize, width), y: tempHeight - pitchHeight * 0.75));

      PersonDatabase.get().updatePersonInDatabase(Person(id: 22, role: Constants.manager, number: -1, name: '-', image: null, x: -1.0, y: -1.0));
    } else {
      team.forEach((person){
        players.add(createPlayer(person.id, person.x, person.y));
      });
    }

    return players;
  }

  double calculateWidth(double a, double b, double width) {
    return a * width - b;
  }

  @override
  Widget build(BuildContext context) {
    double fieldHeight = MediaQuery.of(context).size.height - widget.appBarHeight - widget.tabBarHeight - widget.statusBarHeight;
    double fieldWidth = MediaQuery.of(context).size.width;

    double marginTop = (fieldHeight * Constants.fieldTBRatio) / 2 - Constants.widgetSize/2;

    List<PlayerWidget> players = loadPlayers(fieldHeight, fieldWidth);

    return new Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background.png',
          ),
          Container(
            margin: EdgeInsets.only(top: marginTop),
            child: ManagerWidget(),
          ),
          Players(
            players: players,
          )
        ]
    );
  }
}

class Players extends StatefulWidget {
  final List<PlayerWidget> players;

  const Players({Key key, this.players}) : super(key: key);

  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.players,
    );
  }
}


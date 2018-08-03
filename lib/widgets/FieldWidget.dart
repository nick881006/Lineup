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
  PlayerWidget createPlayer(double x, double y) {
    return PlayerWidget(
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

    //TODO if already stores

    List<PlayerWidget> players = new List();

    // initialize default pos
    // GK
    players.add(createPlayer(width / 2 - Constants.widgetSize / 2, height - height * Constants.fieldTBRatio - widget.statusBarHeight - Constants.widgetSize/2));

    // DF
    players.add(createPlayer(0.1 * width, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.27 - Constants.widgetSize));
    players.add(createPlayer(0.9 * width - Constants.widgetSize, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.27 - Constants.widgetSize));
    players.add(createPlayer(0.3 * width, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.2 - Constants.widgetSize));
    players.add(createPlayer(0.7 * width - Constants.widgetSize, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.2 - Constants.widgetSize));

    // MF
    players.add(createPlayer(0.1 * width, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.5 - Constants.widgetSize));
    players.add(createPlayer(0.9 * width - Constants.widgetSize, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.5 - Constants.widgetSize));
    players.add(createPlayer(0.3 * width, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.5 - Constants.widgetSize));
    players.add(createPlayer(0.7 * width - Constants.widgetSize, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.5 - Constants.widgetSize));

    // FW
    players.add(createPlayer(0.3 * width, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.75 - Constants.widgetSize));
    players.add(createPlayer(0.7 * width - Constants.widgetSize, height - height * Constants.fieldTBRatio - widget.statusBarHeight - pitchHeight*0.75 - Constants.widgetSize));

    return players;
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


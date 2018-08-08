import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/pages/PlayerDetailPage.dart';
import 'package:Lineup11/utils/Database.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/Constants.dart';

//TODO position bug
class PlayerWidget extends StatefulWidget {
  final Person player;
  final double appBarHeight;
  final double tabBarHeight;
  final double statusBarHeight;

  PlayerWidget({Key key, this.player, this.appBarHeight, this.tabBarHeight, this.statusBarHeight}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  Offset position = Offset(0.0, 0.0);

  bool isClicked = false;

  @override
  void initState() {
    super.initState();

    position = new Offset(widget.player.x, widget.player.y);
  }

  void onTapDown(TapDownDetails t) {
    setState(() {
      isClicked = true;
    });
  }

  void onTapUp(TapUpDetails t) {
    setState(() {
      isClicked = false;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayerDetailPage(
            person: widget.player,
          )),
      );
    });
  }

  void onTapCancel() {
    setState(() {
      isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fieldHeight = screenHeight - widget.statusBarHeight - widget.appBarHeight - widget.tabBarHeight;
    double fieldWidth = screenWidth;

    double fieldMarginTB = fieldHeight * Constants.fieldTBRatio;
    double fieldMarginLR = fieldWidth * Constants.fieldLRRatio;

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        child: buildPlayer(isClicked ? Colors.white70 : Colors.white),
        feedback: buildPlayer(isClicked ? Colors.white70 : Colors.white),
        childWhenDragging: buildPlayer(Colors.transparent),
        onDraggableCanceled: (v, o) {
            if(!mounted) {
              return;
            }

            setState(() {
              double dx = o.dx;
              double dy = o.dy - widget.appBarHeight - widget.statusBarHeight;

              // boundary check
              if (dx < fieldMarginLR) {
                dx = fieldMarginLR;
              }

              if (dy < fieldMarginTB) {
                dy = fieldMarginTB;
              }

              if (dx + fieldMarginLR + Constants.widgetSize > screenWidth) {
                dx = screenWidth - fieldMarginLR*2 - Constants.widgetSize;
              }

              if (dy + Constants.widgetSize + widget.tabBarHeight + widget.appBarHeight + widget.statusBarHeight + fieldMarginTB > screenHeight) {
                dy = screenHeight - fieldMarginTB - Constants.widgetSize - widget.appBarHeight - widget.statusBarHeight - widget.tabBarHeight;
              }

              position = new Offset(dx, dy);

              // update database and array record
              widget.player.x = dx;
              widget.player.y = dy;

              PersonDatabase.get().updatePersonInDatabase(widget.player);
            });
        },
      ),
    );
  }

  Widget buildPlayer(Color color) {
    String displayName = widget.player.number == -1? widget.player.name: widget.player.number.toString() + '.' + widget.player.name;

    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ImageIcon(
              AssetImage('images/ic_player.png'),
              color: color,
              size: Constants.widgetSize,
            ),
            Text(
              displayName,
              style: TextStyle(
                fontSize: 16.0,
                color: color,
              ),
            ),
          ],
        ),
        color: Colors.transparent,
      )
    );
  }
}

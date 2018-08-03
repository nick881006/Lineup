import 'package:flutter/material.dart';
import 'package:Lineup11/utils/Constants.dart';

class PlayerWidget extends StatefulWidget {
  final Offset offset;
  final double appBarHeight;
  final double tabBarHeight;
  final double statusBarHeight;

  PlayerWidget({Key key, this.offset, this.appBarHeight, this.tabBarHeight, this.statusBarHeight}) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  String name;

  Offset position = Offset(0.0, 0.0);

  bool isClicked = false;

  @override
  void initState() {
    super.initState();

    position = widget.offset;
  }

  void onTapDown(TapDownDetails t) {
    setState(() {
      isClicked = true;
    });
  }

  void onTapUp(TapUpDetails t) {
    setState(() {
      isClicked = false;

      Navigator.pushNamed(context, '/PlayerDetailPage');
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
            });
        },
      ),
    );
  }

  Widget buildPlayer(Color color) {
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
              'Brozovic',
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

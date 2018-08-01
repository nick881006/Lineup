import 'package:flutter/material.dart';
import 'package:lineup/utils/Constants.dart';

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

  @override
  void initState() {
    super.initState();

    position = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    Widget player = GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage('images/ic_player.png'),
            color: Colors.white,
            size: Constants.widgetSize,
          ),
          Text(
            'Brozovic',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/PlayerDetailPage');
      },
    );

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        child: player,
        feedback: player,
        onDraggableCanceled: (v, o) {
            if(!mounted) {
              return;
            }

            setState(() {
              double dx = o.dx;
              double dy = o.dy - widget.appBarHeight - widget.statusBarHeight;

              // boundary check
              if (dx < 0) {
                dx = 0.0;
              }

              if (dy < 0) {
                dy = 0.0;
              }

              if (dx > screenWidth - Constants.widgetSize) {
                dx = screenWidth - Constants.widgetSize;
              }

              if (o.dy + Constants.widgetSize + widget.tabBarHeight > screenHeight) {
                dy = screenHeight - Constants.widgetSize - widget.appBarHeight - widget.statusBarHeight - widget.tabBarHeight - Constants.widgetSize/2;
              }

              position = new Offset(dx, dy);
            });
        },
      ),
    );
  }
}

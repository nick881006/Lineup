import 'package:flutter/material.dart';
import 'package:lineup/pages/PlayerDetailPage.dart';

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
//  bool isTapped = false;

//  void onTapDown(TapDownDetails tap) {
//    setState(() {
//      isTapped = true;
//    });
//  }
//
//  void onTapUp(TapUpDetails tap) {
//    setState(() {
//      isTapped = false;
//    });
//
//    Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => PlayerDetailPage())
//    );
//  }

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
            size: 40.0,
          ),
          Text(
            '-',
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

              if (dx > screenWidth - 40) {
                dx = screenWidth - 40;
              }

              if (o.dy +  40 + widget.tabBarHeight > screenHeight) {
                dy = screenHeight - 40 - widget.appBarHeight - widget.statusBarHeight - widget.tabBarHeight - 20;
              }

              position = new Offset(dx, dy);
            });
        },
      ),
    );
  }
}

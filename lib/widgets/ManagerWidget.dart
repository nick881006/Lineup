import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/pages/PlayerDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/Constants.dart';

class ManagerWidget extends StatefulWidget {
  final Person manager;

  const ManagerWidget({Key key, this.manager}) : super(key: key);

  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  bool isClicked = false;

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
              person: widget.manager,
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
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage('images/ic_manager.png'),
            color: isClicked ? Colors.white70 : Colors.white,
            size: Constants.widgetSize,
          ),
          Text(
            widget.manager.name,
            style: TextStyle(
              fontSize: 18.0,
              color: isClicked ? Colors.white70 : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

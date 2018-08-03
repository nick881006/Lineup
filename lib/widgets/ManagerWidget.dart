import 'package:flutter/material.dart';
import 'package:Lineup11/utils/Constants.dart';

class ManagerWidget extends StatefulWidget {
  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  String name;
  //TODO image

  bool isClicked = false;

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
            'manager name',
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

import 'package:flutter/material.dart';
import 'package:lineup/pages/PlayerDetailPage.dart';

class ManagerWidget extends StatefulWidget {
  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  String name;
  //TODO image

  bool isTapped = false;

  void onTapDown(TapDownDetails tap){
    setState(() {
      isTapped = true;
    });
  }

  void onTapUp(TapUpDetails tap) {
    setState(() {
      isTapped = false;
    });

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlayerDetailPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage('images/ic_manager.png'),
            color: isTapped ? Colors.grey: Colors.white,
            size: 40.0,
          ),
          Text(
            'manager name',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

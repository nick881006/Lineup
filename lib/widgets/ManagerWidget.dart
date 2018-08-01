import 'package:flutter/material.dart';
import 'package:lineup/utils/Constants.dart';

class ManagerWidget extends StatefulWidget {
  @override
  _ManagerWidgetState createState() => _ManagerWidgetState();
}

class _ManagerWidgetState extends State<ManagerWidget> {
  String name;
  //TODO image

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/PlayerDetailPage');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage('images/ic_manager.png'),
            color: Colors.white,
            size: Constants.widgetSize,
          ),
          Text(
            'manager name',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}

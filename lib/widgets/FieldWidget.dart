import 'package:flutter/material.dart';
import 'package:lineup/widgets/Background.dart';
import 'package:lineup/widgets/ManagerWidget.dart';
import 'package:lineup/widgets/PlayerWidget.dart';

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
  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background.png',
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: ManagerWidget(),
          ),
          PlayerWidget(
            offset: Offset(0.0, 0.0),
            appBarHeight: widget.appBarHeight,
            tabBarHeight: widget.tabBarHeight,
            statusBarHeight: widget.statusBarHeight,
          ),
        ]
    );
  }
}

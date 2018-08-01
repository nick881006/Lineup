import 'package:flutter/material.dart';
import 'package:lineup/utils/Constants.dart';
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
    double fieldHeight = MediaQuery.of(context).size.height - widget.appBarHeight - widget.tabBarHeight - widget.statusBarHeight;
    double fieldWidth = MediaQuery.of(context).size.width;

    double marginTop = (fieldHeight * Constants.fieldHeadRatio) / 2 - Constants.widgetSize/2;

    return new Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background.png',
          ),
          Container(
            margin: EdgeInsets.only(top: marginTop),
            child: ManagerWidget(),
          ),
          PlayerWidget(
            offset: Offset(0.0, fieldHeight*0.16),
            appBarHeight: widget.appBarHeight,
            tabBarHeight: widget.tabBarHeight,
            statusBarHeight: widget.statusBarHeight,
          ),
        ]
    );
  }
}

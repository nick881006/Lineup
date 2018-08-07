import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/CommonTools.dart';
import 'package:Lineup11/widgets/Background.dart';

class PlayerDetailPage extends StatefulWidget {
  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  bool isResetClicked = false;
  bool isChangeClicked = false;

  final nameTextController = TextEditingController();
  final numberTextController = TextEditingController();

  void onResetTapDown(TapDownDetails t) {
    setState(() {
      isResetClicked = true;
    });
  }

  void onResetTapUp(TapUpDetails t) {
    setState(() {
      isResetClicked = false;

      //TODO
      //reset
    });
  }

  void onResetTapCancel() {
    setState(() {
      isResetClicked = false;
    });
  }

  void onChangeTapDown(TapDownDetails t) {
    setState(() {
      isChangeClicked = true;
    });
  }

  void onChangeTapUp(TapUpDetails t) {
    setState(() {
      isChangeClicked = false;

      print(numberTextController.text);
      print(nameTextController.text);

      //TODO
      //popup menu
    });
  }

  void onChangeTapCancel() {
    setState(() {
      isChangeClicked = false;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: Tools.cupertinoCloseButtonBuilder(context, 'Cancel'),
        middle: Text('Player Detail'),
        trailing: CupertinoButton(
            child: Text('Save'),
            onPressed: () {}),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundWidget(
            imagePath: 'images/background2.png',
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Reset\nImage',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: isResetClicked ? Colors.white70 : Colors.white,
                        ),
                      ),
                      onTapDown: onResetTapDown,
                      onTapUp: onResetTapUp,
                      onTapCancel: onResetTapCancel,
                    ),
                    Image.asset(
                      'images/ic_player_big.png',
                    ),
                    GestureDetector(
                      child: Text(
                        'Change\n Image',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: isChangeClicked ? Colors.white70 : Colors.white,
                        ),
                      ),
                      onTapDown: onChangeTapDown,
                      onTapUp: onChangeTapUp,
                      onTapCancel: onChangeTapCancel,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Number',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(right: 20.0),
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: TextField(
                              controller: numberTextController,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                border: InputBorder.none,
                                hintText: 'Number',
                              )
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(new Radius.circular(5.0))
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0),
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: TextField(
                            controller: nameTextController,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              border: InputBorder.none,
                              hintText: 'Name',
                            )
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(new Radius.circular(5.0))
                        ),
                      )
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}

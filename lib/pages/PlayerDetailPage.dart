import 'package:Lineup11/model/Person.dart';
import 'package:Lineup11/utils/Constants.dart';
import 'package:Lineup11/utils/Database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Lineup11/utils/CommonTools.dart';
import 'package:Lineup11/widgets/Background.dart';

class PlayerDetailPage extends StatefulWidget {
  final Person person;

  const PlayerDetailPage({Key key, this.person}) : super(key: key);

  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  bool isResetClicked = false;
  bool isChangeClicked = false;

  var nameTextController = TextEditingController();
  var numberTextController = TextEditingController();

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
  void initState() {
    super.initState();

    nameTextController = TextEditingController();
    numberTextController = TextEditingController();

    if (widget.person.number != -1) {
      numberTextController.text = widget.person.number.toString();
    }

    if (widget.person.name != '-') {
      nameTextController.text = widget.person.name;
    }

  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberTextController.dispose();
    nameTextController.dispose();
    super.dispose();
  }

  Widget constructRow(String text, TextEditingController controller, TextInputType textInputType) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              text,
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
              child: TextFormField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    border: InputBorder.none,
                    hintText: text,
                  ),
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
    );
  }

  List<Widget> constructInputField() {
    List<Widget> widgets = new List();

    if (widget.person.role != Constants.manager) {
      widgets.add(Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: constructRow('Number', numberTextController, TextInputType.numberWithOptions()),
      ));
    }

    widgets.add(constructRow('Name', nameTextController, TextInputType.text));

    return widgets;
  }

  void onPressSave() {
    if(numberTextController.text == '') {
      widget.person.number = -1;
    } else {
      widget.person.number = int.parse(numberTextController.text);
    }

    if(nameTextController.text == '') {
      widget.person.name = '-';
    } else {
      widget.person.name = nameTextController.text;
    }

    // TODO process image

    PersonDatabase.get().updatePersonInDatabase(widget.person);

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Saved!'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pushNamed('/TeamPage');
                },
                child: Text('Ok'),
                isDefaultAction: true,
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CupertinoNavigationBar(
        leading: Tools.cupertinoCloseButtonBuilder(context, 'Cancel'),
        middle: widget.person.role == Constants.manager? Text('Manager Detail') : Text('Player Detail'),
        trailing: CupertinoButton(
            child: Text('Save'),
            onPressed: onPressSave
        ),
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
              Column(
                children: constructInputField(),
              )
            ],
          )
        ],
      )
    );
  }
}

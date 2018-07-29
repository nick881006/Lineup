import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/pages/InfoPage.dart';
import 'package:lineup/pages/PlayersPage.dart';
import 'package:lineup/pages/TeamPage.dart';

void main() => runApp(new LineupApp());

class LineupApp extends StatefulWidget {
  @override
  _LineupAppState createState() => _LineupAppState();
}

class _LineupAppState extends State<LineupApp> {
  int _tabIndex = 0;

  var tabImages;
  var tabNames = ['Main', 'Sub'];
  var _body;

  final tabTextStyleSelect = new TextStyle(color: Colors.black);

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          new Image.asset('images/ic_team_normal.png'),
          new Image.asset('images/ic_team_selected.png'),
        ],
        [
          new Image.asset('images/ic_team_normal.png'),
          new Image.asset('images/ic_team_selected.png'),
        ],
      ];
    }

    _body = new IndexedStack(
      children: <Widget>[
        new TeamPage(
          title: 'Main',
        ),
        new TeamPage(
          title: 'Sub',
        ),
      ],
      index: _tabIndex,
    );
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    } else {
      return tabImages[curIndex][0];
    }
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(
        tabNames[curIndex],
        style: tabTextStyleSelect,
      );
    } else {
      return Text(tabNames[curIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.grey),
      home: Builder(
        builder: (context) => new Scaffold(
              appBar: new CupertinoNavigationBar(
                  leading: CupertinoButton(
                      child: Text(
                        'Players',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage()));
                      }),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CupertinoButton(
                          child: Text(
                            'Share',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {}),
                      CupertinoButton(
                          child: Text(
                            'Info',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPage()));
                          }),
                    ],
                  )),
              body: _body,
              bottomNavigationBar: new CupertinoTabBar(
                items: <BottomNavigationBarItem>[
                  new BottomNavigationBarItem(
                    icon: getTabIcon(0),
                    title: getTabTitle(0),
                  ),
                  new BottomNavigationBarItem(
                    icon: getTabIcon(1),
                    title: getTabTitle(1),
                  )
                ],
                currentIndex: _tabIndex,
                onTap: (index) {
                  setState(() {
                    _tabIndex = index;
                  });
                },
              ),
            ),
      ),
    );
  }
}

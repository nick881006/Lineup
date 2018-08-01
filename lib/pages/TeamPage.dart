import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lineup/utils/CommonTools.dart';
import 'package:lineup/widgets/FieldWidget.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final tabTextStyleSelect = new TextStyle(color: Colors.black);

  //  // index of page
  int _tabIndex = 0;

  // images of tabs
  var tabImages;
  // name of tabs
  var tabNames = ['Main', 'Sub'];
  var _body;

  // initialize tab images and corresponding pages
  void initData(double appBarHeight, double tabBarHeight, double statusBarHeight) {
    _body = new IndexedStack(
      children: <Widget>[
        new FieldWidget(
          title: 'Main',
          appBarHeight: appBarHeight,
          tabBarHeight: tabBarHeight,
          statusBarHeight: statusBarHeight,
        ),
        new FieldWidget(
          title: 'Sub',
          appBarHeight: appBarHeight,
          tabBarHeight: tabBarHeight,
          statusBarHeight: statusBarHeight,
        ),
      ],
      index: _tabIndex,
    );
  }

  // get tab image based on index
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    } else {
      return tabImages[curIndex][0];
    }
  }

  // get tab name based on index
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

    // initialize app bar
    CupertinoNavigationBar appBar = CupertinoNavigationBar(
        leading: Tools.cupertinoButtonBuilder(context, 'Player', '/PlayerPage'),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Tools.cupertinoButtonBuilder(context, 'Share', null),
            Tools.cupertinoButtonBuilder(context, 'Info', '/InfoPage'),
          ],
        )
    );

    // initialize tab bar
    CupertinoTabBar tabBar = new CupertinoTabBar(
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
    );

    double appBarHeight = appBar.preferredSize.height;
    double tabBarHeight = tabBar.preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    initData(appBarHeight, tabBarHeight, statusBarHeight);

    return new Scaffold(
      appBar: appBar,
      body: _body,
      bottomNavigationBar: tabBar,
    );
  }
}

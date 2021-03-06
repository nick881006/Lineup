import 'package:flutter/cupertino.dart';

class Tools {
  static CupertinoButton cupertinoButtonBuilder(BuildContext context, String title, String route) {
    return CupertinoButton(
      child: Text(title),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  static CupertinoButton cupertinoCloseButtonBuilder(BuildContext context, String title) {
    return CupertinoButton(
      child: Text(title),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
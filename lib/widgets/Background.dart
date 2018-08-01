import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final String imagePath;

  BackgroundWidget({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(imagePath),
              fit: BoxFit.fill
          )
      ),
    );
  }
}

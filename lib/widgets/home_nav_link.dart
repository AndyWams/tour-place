import 'package:flutter/material.dart';

import '../styles.dart';
import 'nav_icons.dart';

class HomeNavLinks extends StatelessWidget {
  final String _text;
  final _icons;
  HomeNavLinks(this._text, this._icons);
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        NavIcons(_icons, 50.0, 55.0),
        Container(margin: EdgeInsets.only(top: 10.0)),
        Text(
          _text,
          textAlign: TextAlign.center,
          style: small,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../styles.dart';

class PlaceDetail extends StatelessWidget {
  final String _img;
  final String _location;
  // final _value;
  PlaceDetail(this._img, this._location);
  Widget build(context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, right: 10.0),
        padding: EdgeInsets.fromLTRB(13.0, 0.0, 13.0, 40.0),
        width: 220.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
              image: AssetImage(_img),
              fit: BoxFit.cover,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _location,
              style: p2,
              textAlign: TextAlign.left,
            )
          ],
        ));
  }
}

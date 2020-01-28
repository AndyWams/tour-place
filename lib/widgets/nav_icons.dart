import 'package:flutter/material.dart';

class NavIcons extends StatelessWidget {
  final _icons;
  final double width;
  final double height;
  NavIcons(this._icons, this.height, this.width);
  Widget build(context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.pink[50],
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(_icons),
          color: Colors.red[400],
        ));
  }
}

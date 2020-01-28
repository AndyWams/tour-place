import 'package:flutter/material.dart';

const faded_black = Color.fromRGBO(80, 60, 60, 1);
const soft_pink = Color.fromRGBO(255, 68, 68, 0.91);
const soft_grey = Color.fromRGBO(52, 58, 64, 0.6);

const appBarText = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 25,
);

const h1 = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 40,
);

const h2 = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  fontSize: 28,
  color: faded_black,
);

const h3 = TextStyle(
  color: Colors.black54,
  fontFamily: 'Nunito',
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
);

const h4 = TextStyle(
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: faded_black,
  fontSize: 23,
);

const customSpan = TextStyle(
  color: soft_pink,
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'Nunito',
  height: 1.5,
);

const p1 = TextStyle(
  color: Colors.white,
  fontFamily: 'Nunito',
  fontSize: 18,
  height: 1.5,
);
const p2 = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Nunito',
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

const p3 = TextStyle(
  fontSize: 15.0,
  color: soft_grey,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
);

const small = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Nunito',
);

const info_style_text = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Nunito',
  fontWeight: FontWeight.w700,
  color: Colors.grey,
);

const black = TextStyle(
  color: Colors.black54,
  fontFamily: 'Nunito',
);
const curvedBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0));

const roundedBorder =
    BoxDecoration(color: Colors.grey, borderRadius: curvedBorderRadius);

Widget iconDecorationGrey(name) {
  return Icon(
    name,
    color: Colors.grey,
    size: 20.0,
  );
}

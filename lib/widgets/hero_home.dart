import 'package:flutter/material.dart';
import 'package:tour/styles.dart';

class HeroHome extends StatelessWidget {
  Widget build(context) {
    return Container(
      padding: EdgeInsets.only(right: 18.0),
      child: RichText(
        text: TextSpan(
          text: 'Hello',
          style: customSpan,
          children: <TextSpan>[
            TextSpan(text: ', what are you looking for?', style: black),
          ],
        ),
      ),
    );
  }
}

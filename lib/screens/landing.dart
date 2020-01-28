import 'package:flutter/material.dart';
import 'package:tour/styles.dart';

class Landing extends StatelessWidget {
  build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mountain-3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
          padding: EdgeInsets.only(bottom: 40.0),
          alignment: Alignment.bottomCenter,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              welcomeText(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              actionBtn(context)
            ],
          )),
    );
  }

  Widget welcomeText() {
    return ListTile(
      title: Text(
        'Enjoy the world',
        style: h1,
        textAlign: TextAlign.center,
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
        child: Text(
          "We'll help you find the best expenriences & adventures",
          style: p1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget actionBtn(BuildContext context) {
    return Container(
        width: 60,
        height: 50,
        padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(15.0),
            color: Colors.white),
        child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink[200],
              size: 15.0,
            )));
  }
}

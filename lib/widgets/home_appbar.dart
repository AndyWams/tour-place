import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget with PreferredSizeWidget {
  Widget build(context) {
    return Container(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
        child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Builder(
              builder: (BuildContext context) {
                return leadingIcon(context);
              },
            ),
            actions: <Widget>[
              Container(
                width: 55.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage("assets/images/mountain-3.png"),
                      fit: BoxFit.cover,
                    )),
              ),
            ]));
  }

  Widget leadingIcon(context) {
    return IconButton(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 0.0),
      icon: Icon(
        Icons.short_text,
        color: Colors.black,
        size: 35.0,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

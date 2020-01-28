import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  Widget build(context) {
    return Container(
      child: BottomNavigationBar(
        // elevation: 0.0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: BtmIcon(Icons.home, 30.0, Colors.red[400]),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: BtmIcon(Icons.favorite_border, 30.0, Colors.red[400]),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: BtmIcon(Icons.person, 30.0, Colors.red[400]),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}

class BtmIcon extends StatelessWidget {
  final IconData _name;
  final double _size;
  final Color _color;

  BtmIcon(this._name, this._size, this._color);

  Widget build(context) {
    return Icon(
      _name,
      size: _size,
      color: _color,
    );
  }
}

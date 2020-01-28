import 'package:flutter/material.dart';
import 'package:tour/main.dart';
import 'package:tour/services/tour_service.dart';
import 'package:tour/widgets/bottom_nav.dart';
import 'package:tour/widgets/hero_home.dart';
import 'package:tour/widgets/home_appbar.dart';
import 'package:tour/widgets/home_nav_link.dart';
import 'package:tour/widgets/place_detail.dart';
import '../styles.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: HomeAppbar(),
          drawer: Drawer(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text('Content Here...'),
            ),
          ),
          body: SingleChildScrollView(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
                    child: Column(
                      children: <Widget>[
                        HeroHome(),
                        navLink(),
                        seeMore(),
                      ],
                    )),
                Places(),
              ],
            ),
          )),
          bottomNavigationBar: BottomNav()),
    );
  }

  Widget navLink() {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      // decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          HomeNavLinks('Accomodations', Icons.home),
          HomeNavLinks('Experiences', Icons.fastfood),
          HomeNavLinks('Adventures', Icons.directions_bike),
          HomeNavLinks('Flights', Icons.airplanemode_active)
        ],
      ),
    );
  }

  Widget seeMore() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Best Experiences",
            style: h3,
          ),
          IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 0.0),
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class Places extends StatelessWidget {
  Widget build(context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 0.0),
        height: 250.0,
        child: _myPlaces());
  }

  Widget _myPlaces() {
    return FutureBuilder(
        future: fetchTours(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(
                "No data found !!!",
                style: customSpan,
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                var mydataId = snapshot.data[index].id;
                return GestureDetector(
                  onTap: () {
                    _onTourTap(context, mydataId);
                  },
                  child: PlaceDetail('${snapshot.data[index].imagePath}',
                      '${snapshot.data[index].name}'),
                );
              },
            );
          } else
            return CircularProgressIndicator();
        });
  }

  _onTourTap(BuildContext context, int tourId) {
    Navigator.pushNamed(context, PlacesDetailRoute, arguments: tourId);
  }
}

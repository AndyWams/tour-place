import 'package:flutter/material.dart';
import 'package:tour/models/tour_model.dart';
import 'package:tour/services/tour_service.dart';
import 'package:tour/styles.dart';
import 'package:tour/widgets/nav_icons.dart';

class PlaceDetails extends StatelessWidget {
  final int tourID;

  PlaceDetails(this.tourID);
  Widget build(context) {
    return FutureBuilder(
        future: getByID(tourID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: soft_pink,
                      title: Container(
                        child: Text('${snapshot.data.name}', style: appBarText),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TourImage('${snapshot.data.imagePath}'),
                          TourDistanceWithDays('${snapshot.data.days}',
                              '${snapshot.data.milage}'),
                        ]..addAll(textSections(snapshot.data)),
                      ),
                    )));
          } else
            return CircularProgressIndicator();
        });
  }

  List<Widget> textSections(Tour place) {
    return place.details
        .map((detail) => TourTextSection(detail.title, detail.text))
        .toList();
  }
}

class TourImage extends StatelessWidget {
  final String imagePath;
  TourImage(this.imagePath);
  Widget build(contex) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 250.0),
          decoration: roundedBorder,
          child: ClipRRect(
            borderRadius: curvedBorderRadius,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: -(25.0),
          right: 40,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                width: 50.0,
                height: 55.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 3, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        4.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: Colors.red[400],
                )),
          ),
        )
      ],
    );
  }
}

class TourDistanceWithDays extends StatelessWidget {
  final String _days;
  final String _mile;

  TourDistanceWithDays(this._days, this._mile);
  Widget build(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 25, 40, 0),
      child: Row(
        children: <Widget>[
          iconDecorationGrey(Icons.calendar_today),
          SizedBox(width: 10),
          Text(
            _days,
            style: info_style_text,
          ),
          SizedBox(width: 20),
          iconDecorationGrey(Icons.room),
          Text(
            _mile,
            style: info_style_text,
          )
        ],
      ),
    );
  }
}

class TourTextSection extends StatelessWidget {
  final String _title;
  final String _body;

  TourTextSection(this._title, this._body);
  @override
  Widget build(context) {
    return Container(
        padding: EdgeInsets.fromLTRB(40, 25, 40, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  _title,
                  style: h2,
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(_body, style: p3)),
          ],
        ));
  }
}

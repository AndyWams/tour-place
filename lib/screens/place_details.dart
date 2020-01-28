import 'package:flutter/material.dart';
import 'package:tour/models/tour_model.dart';
import 'package:tour/services/tour_service.dart';
import 'package:tour/styles.dart';

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
    return Container(
      constraints: BoxConstraints.expand(height: 250.0),
      decoration: roundedBorder,
      child: ClipRRect(
          borderRadius: curvedBorderRadius,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          )),
    );
  }
}

class TourDistanceWithDays extends StatelessWidget {
  final String _days;
  final String _mile;

  TourDistanceWithDays(this._days, this._mile);
  Widget build(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 12, 40, 0),
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
        padding: EdgeInsets.fromLTRB(40, 30, 40, 20),
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

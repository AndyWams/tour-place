import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:tour/models/tour_model.dart';

Future<dynamic> loadTourAsset() async {
  return await rootBundle.loadString('assets/tours.json');
}

//Fetch all tours and render them on a listview
Future fetchTours() async {
  dynamic jsonTour = await loadTourAsset();
  var tourList = TourList.fromJson(json.decode(jsonTour));
  var records = tourList.places.toList();
  return records;
}

//Fetch the details of a single Tour when a tour is tapped from the list
Future getByID(int tourId) async {
  List<Tour> places = await fetchTours();
  for (var i = 0; i < places.length; i++) {
    if (places[i].id == tourId) {
      return places[i];
    }
  }
  return null;
}

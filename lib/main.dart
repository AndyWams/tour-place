import 'package:flutter/material.dart';
import 'package:tour/screens/place_details.dart';
import 'screens/landing.dart';
import 'screens/home.dart';

const _Landing = '/';
const _Home = '/home';
const PlacesDetailRoute = '/place_details';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget landingHome() {
    return Scaffold(
      body: Landing(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final int arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case _Landing:
          screen = landingHome();
          break;
        case _Home:
          screen = Home();
          break;
        case PlacesDetailRoute:
          screen = PlaceDetails(arguments);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

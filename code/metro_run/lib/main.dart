import 'package:flutter/material.dart';
import 'package:metro_run/booking.dart';
import 'package:metro_run/mapPage.dart';
import 'package:metro_run/profile_page.dart';
import 'package:metro_run/rides.dart';
import 'package:metro_run/ticket.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/loginpage': (BuildContext context) => new LoginPage(),
        '/profilepage': (BuildContext context) => new ProfilePage(),
        '/ridespage': (BuildContext context) => new RidesPage(),
        '/mapdisplaypage': (BuildContext context) => new MapDisplayPage(),
        '/bookingpage': (BuildContext context) => new Booking(),
        '/ticketpage': (BuildContext context) => new Ticket(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return new CircleAvatar(
      child: SplashScreen(
        seconds: 4,
        navigateAfterSeconds: LoginPage(),
        image: Image.asset('assets/MetroRunSplashScreen.png'),
        backgroundColor: Colors.white,
        loaderColor: Colors.green[800],
        photoSize: 200.0,
      ),
    );
  }
}

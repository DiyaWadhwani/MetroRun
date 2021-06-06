import 'package:flutter/material.dart';
import 'package:metrorun/booking.dart';
import 'package:metrorun/home_page.dart';
import 'package:metrorun/mapPage.dart';
import 'package:metrorun/payment.dart';
import 'package:metrorun/profile_page.dart';
import 'package:metrorun/qr.dart';
import 'package:metrorun/rides.dart';
import 'package:metrorun/ticket.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login_page.dart';

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
        // '/landingpage': (BuildContext context) => new MyApp(),
        // '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/loginpage': (BuildContext context) => new LoginPage(),
        '/profilepage': (BuildContext context) => new ProfilePage(),
        '/ridespage': (BuildContext context) => new RidesPage(),
        '/mapdisplaypage': (BuildContext context) => new MapDisplayPage(),
        '/bookingpage': (BuildContext context) => new Booking(),
        '/ticketpage': (BuildContext context) => new Ticket(),
        '/paymentPage': (BuildContext context) => new Payment(),
        '/qrcodepage': (BuildContext context) => new QRCode()
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

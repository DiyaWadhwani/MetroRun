import 'package:flutter/material.dart';
import 'package:metro_run/mapPage.dart';
import 'package:metro_run/profile_page.dart';
import 'package:metro_run/rides.dart';

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
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignUpPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/loginpage': (BuildContext context) => new LoginPage(),
        '/profilepage': (BuildContext context) => new ProfilePage(),
        '/ridespage': (BuildContext context) => new RidesPage(),
        '/mapdisplaypage': (BuildContext context) => new MapDisplayPage()
      },
    );
  }
}

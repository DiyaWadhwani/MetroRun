import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metrorun/booking.dart';
import 'package:metrorun/home_page.dart';
import 'package:metrorun/mapPage.dart';
import 'package:metrorun/payment.dart';
import 'package:metrorun/profile_page.dart';
import 'package:metrorun/qr.dart';
import 'package:metrorun/rides.dart';
import 'package:metrorun/ticket.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import 'login_page.dart';
import 'translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales:[
        Locale('en'),
        Locale('kn'),
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
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
        '/qrcodepage': (BuildContext context) => new QR()
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

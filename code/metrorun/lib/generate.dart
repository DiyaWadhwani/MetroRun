import 'package:flutter/material.dart';
import 'package:metrorun/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'dart:core';

import 'firestore.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
// ignore: non_constant_identifier_names
String RandomString(int strlen) {
  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  //the qr generated everytime is unique
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  //string for qr code - save to hive
  print(result);
  return result;
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = RandomString(10); // generating unique string for qr code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title:
            Text('Your unique QR Code', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: QrImage(
                data: qrData,
                size: 258,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 40, width: 150),
              child: OutlinedButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(
                        color: Colors.green[300], fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/homepage');
                  }),
            ),
            SizedBox(height: 20.0),
            OutlinedButton(
                child: Text(
                  'Save QR code until Ride ends',
                  style: TextStyle(
                      color: Colors.green[300], fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green, width: 3.0),
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  print("Adding ride details to firestore");
                  myQrString = qrData;
                  updateRideData();
                  Navigator.of(context).pushNamed('/homepage');
                }),
          ],
        ),
      ),
    );
  }
}

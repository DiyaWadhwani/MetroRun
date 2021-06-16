import 'package:flutter/material.dart';
import 'package:metrorun/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'dart:core';

import 'firestore.dart';

var from, to, date, time;
double amountToBePaid = 0.0;
senddetails(var from_, var to_, var date_, time_, double _amount) {
  from = from_;
  to = to_;
  date_ = date;
  time_ = time;
  amountToBePaid = _amount;
}

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: QrImage(
                data: qrData,
                size: 258,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 40, width: 100),
              child: OutlinedButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/homepage');
                  }),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 40, width: 250),
              child: OutlinedButton(
                  child: Text(
                    'Save QR code until Ride ends',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green.shade300,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0))),
                  onPressed: () {
                    print("Adding ride details to firestore");
                    myQrString = qrData;
                    updateRideDataLocally(from, to, date, time, amountToBePaid);
                    Navigator.of(context).pushNamed('/homepage');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

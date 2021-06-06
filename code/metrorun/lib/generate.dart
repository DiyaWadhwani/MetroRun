import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'dart:core';

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
  print(result);
  return result;
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = RandomString(10);// generating unique string for qr code
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[300],
            title: Text('QR Code',
            style: TextStyle(color: Colors.black)
            ),
            centerTitle: true,
            actions: <Widget>[],
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  data: qrData,   //plce where the QR Image will be shown
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        );
      }
    }
  
  
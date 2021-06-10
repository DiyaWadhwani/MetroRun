import 'package:flutter/material.dart';
import 'generate.dart';

class QR extends StatefulWidget {
  @override
  _QRState createState() => _QRState();
}

class _QRState extends State<QR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: AssetImage('assets/paymentSuccessful.png'),
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 30.0,
            ),
            flatButton("Generate QR Code", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return TextButton(
      // padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
      ),
      // shape: RoundedRectangleBorder(
      // side: BorderSide(color: Colors.green, width: 3.0),
      // borderRadius: BorderRadius.circular(20.0)),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        backgroundColor: Colors.green[800],
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You are now set to Metro Run!'),
              SizedBox(
                height: 15.0,
              ),
              new OutlinedButton(
                  child: Text(
                    'Exit',
                    style: (TextStyle(color: Colors.green[800])),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/loginpage');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset("assets/MetroMap.jpg"),
          ),
          ElevatedButton(
            child: Text('View Map'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[200],
              onPrimary: Colors.green[800],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/mapdisplaypage');
            },
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight,
            child: Text('View the routes of Namma Metro, Bengaluru.'),
          ),
        ],
      ),
    );
  }
}

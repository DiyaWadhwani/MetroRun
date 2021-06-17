import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'translations/locale_keys.g.dart';

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
            child: Text(LocaleKeys.View_map.tr()),
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
            child: Text(LocaleKeys.View_routes.tr()),
          ),
        ],
      ),
    );
  }
}

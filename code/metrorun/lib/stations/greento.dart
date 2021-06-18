import 'package:flutter/material.dart';
import 'package:metrorun/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../booking.dart';

class Station {
  var text;
  var id;
  Station({this.id, this.text});
}

// ignore: must_be_immutable
class GreenTo extends StatefulWidget {
  var from;
  var frm;
  GreenTo({this.from, this.frm});
  _GreenToState createState() => _GreenToState(from: from, frm: frm);
}

class _GreenToState extends State<GreenTo> {
  var from;
  var frm;
  _GreenToState({this.from, this.frm});

  List<Station> stations = [
    Station(id: 1, text: LocaleKeys.Yelachenahalli.tr()),
    Station(id: 2, text: LocaleKeys.Jayaprakash_Nagar.tr()),
    Station(id: 3, text: LocaleKeys.Banashankari.tr()),
    Station(id: 4, text: LocaleKeys.Rashtriya_Vidyalaya_Road.tr()),
    Station(id: 5, text: LocaleKeys.Jayanagar.tr()),
    Station(id: 6, text: LocaleKeys.South_End_Circle.tr()),
    Station(id: 7, text: LocaleKeys.Lalbagh.tr()),
    Station(id: 8, text: LocaleKeys.National_College.tr()),
    Station(id: 9, text: LocaleKeys.KRMarket.tr()),
    Station(id: 10, text: LocaleKeys.Chickpete.tr()),
    Station(
        id: 11, text: LocaleKeys.Nadaprabhu_Kempegowda_Station_Majestic.tr()),
    Station(id: 12, text: LocaleKeys.Mantri_Square_Sampige_Road.tr()),
    Station(id: 13, text: LocaleKeys.Srirampura.tr()),
    Station(id: 14, text: LocaleKeys.Kuvempu_Road.tr()),
    Station(id: 15, text: LocaleKeys.Rajajinagar.tr()),
    Station(id: 16, text: LocaleKeys.Mahalakshmi_layout.tr()),
    Station(id: 17, text: LocaleKeys.Sandal_Soap_Factor.tr()),
    Station(id: 18, text: LocaleKeys.Yeshwantpur.tr()),
    Station(id: 19, text: LocaleKeys.Gorguntepalya.tr()),
    Station(id: 20, text: LocaleKeys.Peenya.tr()),
    Station(id: 21, text: LocaleKeys.Peenya_Industry.tr()),
    Station(id: 22, text: LocaleKeys.Jalahalli.tr()),
    Station(id: 23, text: LocaleKeys.Dasarahalli.tr()),
    Station(id: 24, text: LocaleKeys.Nagasandra.tr())
  ];
  Widget cardtemplate(station) {
    return Card(
        color: Colors.green,
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Booking(
                              from_station: from,
                              from_index: frm,
                              to_station: station.text,
                              to_index: station.id)));
                  print(station.text);
                  print(station.id);
                },
                child: Text(
                  station.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Spacer(),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add_location),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ))
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Select Station',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 30.0, bottom: 30.0),
              child: ListView(
                children:
                    stations.map((station) => cardtemplate(station)).toList(),
              )),
        ]));
  }
}

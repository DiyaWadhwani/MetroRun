import 'package:flutter/material.dart';
import '../booking.dart';
import 'package:metrorun/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Station {
  var text;
  var id;
  Station({this.id, this.text});
}

// ignore: must_be_immutable
class PurpleTo extends StatefulWidget {
  var from;
  var frm;
  PurpleTo({this.from, this.frm});
  _PurpleToState createState() => _PurpleToState(from: from, frm: frm);
}

class _PurpleToState extends State<PurpleTo> {
  var from;
  var frm;
  _PurpleToState({this.from, this.frm});

  List<Station> stations = [
    Station(id: 1, text:LocaleKeys.Baiyyappanahalli.tr()),
    Station(id: 2, text: LocaleKeys.Swami_Vivekananda_Road.tr()),
    Station(id: 3, text: LocaleKeys.Indiranagar.tr()),
    Station(id: 4, text: LocaleKeys.Halasuru.tr()),
    Station(id: 5, text: LocaleKeys.Trinity.tr()),
    Station(id: 6, text: LocaleKeys.Mahatma_Gandhi_Road.tr()),
    Station(id: 7, text: LocaleKeys.Cubbon_Park.tr()),
    Station(id: 8, text: LocaleKeys.Vidhana_Soudha.tr()),
    Station(id: 9, text: LocaleKeys.Sir_M_Vishweshwarayya_Central_College.tr()),
    Station(id: 10, text: LocaleKeys.Nadaprabhu_Kempegowda_Majestic.tr()),
    Station(id: 11, text: LocaleKeys.KSR_City_Railway_Statio.tr()),
    Station(id: 12, text: LocaleKeys.Magadi_Road.tr()),
    Station(id: 13, text: LocaleKeys.Hosahalli.tr()),
    Station(id: 14, text: LocaleKeys.Vijayanagar.tr()),
    Station(id: 15, text: LocaleKeys.Attiguppe.tr()),
    Station(id: 16, text: LocaleKeys.Deepanjali_Nagar.tr()),
    Station(id: 17, text: LocaleKeys.Mysuru_Road.tr())
  ];
  Widget cardtemplate(station) {
    return Card(
        color: Colors.purple[200],
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
        backgroundColor: Colors.purple[400],
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

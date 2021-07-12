import 'package:flutter/material.dart';
import 'package:metrorun/constants.dart';
import 'header_design.dart';
import 'stations/greento.dart';
import 'stations/greenfrom.dart';
import 'stations/purplefrom.dart';
import 'stations/purpleto.dart';
import 'ticket.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class Booking extends StatefulWidget {
  // ignore: non_constant_identifier_names
  var from_station, to_station;
  // ignore: non_constant_identifier_names
  var from_index, to_index;

  // ignore: non_constant_identifier_names
  Booking({this.from_station, this.to_station, this.from_index, this.to_index});

  State<StatefulWidget> createState() => _BookingState(
      from_station: from_station,
      to_station: to_station,
      from_index: from_index,
      to_index: to_index);
}

class _BookingState extends State<Booking> {
  // ignore: non_constant_identifier_names
  var from_station, to_station;
  // ignore: non_constant_identifier_names
  var from_index, to_index;

  _BookingState(
      // ignore: non_constant_identifier_names
      {this.from_station,
      // ignore: non_constant_identifier_names
      this.to_station,
      // ignore: non_constant_identifier_names
      this.from_index,
      // ignore: non_constant_identifier_names
      this.to_index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.green[800],
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushNamed('/homepage');
              }),
          SizedBox(width: 285.0),
          IconButton(icon: Icon(Icons.alt_route_outlined), onPressed: () {}),
        ],
      ),
      // it enable scrolling on small device
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            HeaderDesign(size: size),
            SizedBox(height: 50.0),
            Row(
              children: <Widget>[
                SizedBox(width: 5.0),
                Container(
                  margin: EdgeInsets.fromLTRB(140, 0, 0, 10),
                  child: Text(
                    LocaleKeys.Fromm.tr(),
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(width: 5.0),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[50],
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: Text(
                        LocaleKeys.greenline.tr(),
                        style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GreenFrom()));
                        setState(() {
                          from_station = from_station;
                          from_index = from_index;
                        });
                      }),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                      child: Text(
                        LocaleKeys.purpleline.tr(),
                        style: TextStyle(
                            color: Colors.purple[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          primary: Colors.purple[50],
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Colors.purple, width: 3.0),
                              borderRadius: BorderRadius.circular(20.0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurpleFrom()));
                        setState(() {
                          from_station = from_station;
                          from_index = from_index;
                        });
                      }),
                ),
                SizedBox(width: 5.0),
              ],
            ),
            SizedBox(height: 20.0),
            Text(from_station ?? LocaleKeys.selectline.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(height: 50.0),
            Row(children: <Widget>[
              SizedBox(width: 5.0),
              Container(
                margin: EdgeInsets.fromLTRB(160, 10, 0, 10),
                child: Text(
                  LocaleKeys.Too.tr(),
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              )
            ]),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                SizedBox(width: 5.0),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        primary: Colors.green[50],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: Text(
                        LocaleKeys.greenline.tr(),
                        style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GreenTo(from: from_station, frm: from_index)),
                        );
                        setState(() {
                          to_station = to_station;
                          to_index = to_index;
                        });
                      }),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15.0),
                        primary: Colors.purple[50],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.purple, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: Text(
                        LocaleKeys.purpleline.tr(),
                        style: TextStyle(
                            color: Colors.purple[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PurpleTo(
                                    from: from_station, frm: from_index)));
                        setState(() {
                          to_station = to_station;
                          to_index = to_index;
                        });
                      }),
                ),
                SizedBox(width: 5.0),
              ],
            ),
            SizedBox(height: 20.0),
            Text(to_station ?? LocaleKeys.selectline.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(height: 80.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: ButtonTheme(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0),
                      ),
                      primary: kPrimaryColor,
                    ),
                    child: Text(LocaleKeys.proceed.tr(),
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    onPressed: () {
                      if (from_station == 'Select Line' ||
                          to_station == 'Select Line' ||
                          to_station == null ||
                          from_station == null ||
                          from_station == to_station) {
                        showAlertDialog(context);
                      } else {
                        mySource = from_station;
                        print("Saved from station to mySource :$mySource");
                        myDestination = to_station;
                        print(
                            "Saved to station to myDestination :$myDestination");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ticket(
                                    from_station: from_station,
                                    to_station: to_station,
                                    from_index: from_index,
                                    to_index: to_index)));
                      }
                    }),
              ),
            ),
            // ],
            //),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(LocaleKeys.ok.tr()),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(LocaleKeys.error.tr()),
      content: Text(LocaleKeys.Select_route_to_proceed.tr()),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

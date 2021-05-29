import 'package:flutter/material.dart';
import '../booking.dart';

class Station {
  String text;
  int id;
  Station({this.id,this.text});

}
class GreenTo extends StatefulWidget {
  String from;
  int frm;
  GreenTo({this.from, this.frm});
  _GreenToState createState() => _GreenToState(from: from, frm: frm);
}
class _GreenToState extends State<GreenTo> {
  String from;
  int frm;
  _GreenToState({this.from, this.frm});

  List<Station> stations = [
    Station(id:1,text:'Yelachenahalli'),
    Station(id:2,text:'Jayaprakash Nagar'),
    Station(id:3,text:'Banashankari'),
    Station(id:4,text:'Rashtriya Vidyalaya Road'),
    Station(id:5,text:'Jayanagar'),
    Station(id:6,text:'South End Circle'),
    Station(id:7,text:'Lalbagh'),
    Station(id:8,text:'National College'),
    Station(id:9,text:'K.R.Market'),
    Station(id:10,text:'Chickpete'),
    Station(id:11,text:'Nadaprabhu Kempegowda Station Majestic'),
    Station(id:12,text:'Mantri Square Sampige Road'),
    Station(id:13,text:'Srirampura'),
    Station(id:14,text:'Kuvempu Road'),
    Station(id:15,text:'Rajajinagar'),
    Station(id:16,text:'Mahalakshmi layout'),
    Station(id:17,text:'Sandal Soap Factory'),
    Station(id:18,text:'Yeshwantpur'),
    Station(id:19,text:'Gorguntepalya'),
    Station(id:20,text:'Peenya'),
    Station(id:21,text:'Peenya Industry'),
    Station(id:22,text:'Jalahalli'),
    Station(id:23,text:'Dasarahalli'),
    Station(id:24,text:'Nagasandra')
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
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Booking(
                from_station: from,
                from_index: frm,
                to_station: station.text,
                to_index: station.id)));
            print(station.text);
            print(station.id);     
          },
          child:  Text(
              station.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black, ),
            ),
          ),
         ],
        ),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){ Navigator.pop(context);}),
                Spacer(),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.add_location),color: Colors.white,onPressed: () {},)
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
                Text('Select Station',
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
            padding: EdgeInsets.only(left:25.0,right:25.0,top: 30.0, bottom: 30.0),
              child: ListView(
                children:stations.map((station) => cardtemplate(station)).toList(), 
              )
          ),
        ]
      )
    );
  }
}
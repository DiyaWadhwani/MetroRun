import 'package:flutter/material.dart';
import 'profile_preview.dart';
import 'ticketPreview.dart';
import 'wallet_preview.dart';
import 'color_collection.dart';
import 'map.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorCollection = ColorCollection();

  var selectedOption = 0;

  List allOptions = [
    TicketPreview(),
    MapPage(),
    WalletPreview(),
    ProfilePreview()
  ];

  List isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
        body: Stack(
      children: [
        Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent),
        Container(
            height: screenHeight,
            width: screenWidth / 4,
            color: Colors.transparent),
        Container(
            height: screenHeight,
            width: screenWidth / 4,
            color: colorCollection.leftBarColor),
        Positioned(
          left: screenWidth / 4,
          child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 4),
              color: Colors.white),
        ),
        /* Positioned(
          top: 35.0,
          left: 10.0,
          child: ElevatedButton(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.green[800]),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.green[200]),
            onPressed: () {
              Navigator.of(context).pushNamed('/loginpage');
            },
          ),
        ),
        */
        Positioned(
          top: screenHeight - (screenHeight - 100.0),
          left: (screenWidth / 4) + 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome home!',
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'What would you like to do?',
                style: TextStyle(color: Colors.grey[700], fontSize: 15.0),
              ),

              /*Container(
                height: 40.0,
                width: 225.0,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Colors.green[800].withOpacity(0.4)),
                      ),
                      contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15.0,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[500].withOpacity(0.4),
                      )),
                ),
              ),
              
              Container(
                child: Image.asset("assets/Logo.jpg"),
              ),
              */
            ],
          ),
        ),
        buildSideNavigator(),
        Positioned(
          top: (screenHeight / 3) + 5.0,
          left: (screenWidth / 5) + 25.0,
          child: Container(
            height: screenHeight - ((screenHeight / 3) + 50.0),
            width: screenWidth - ((screenWidth / 5) + 40.0),
            child: allOptions[selectedOption],
          ),
        )
      ],
    ));
  }

  buildSideNavigator() {
    return Positioned(
      top: 75.0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height - 100.0,
          height: MediaQuery.of(context).size.width / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatedBox(quarterTurns: 1, child: buildOption('Tickets', 0)),
              RotatedBox(quarterTurns: 1, child: buildOption('Map', 1)),
              RotatedBox(quarterTurns: 1, child: buildOption('Wallet', 2)),
              RotatedBox(quarterTurns: 1, child: buildOption('Profile', 3)),
            ],
          ),
        ),
      ),
    );
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(
            onTap: () {
              setState(() {
                selectedOption = index;
                isOptionSelected(index);
              });
            },
            child: Text(
              title,
              style: isSelected[index]
                  ? TextStyle(
                      color: Color(0xFF23163D),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}

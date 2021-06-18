import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:metrorun/home_preview.dart';
import 'package:metrorun/logout_preview.dart';
import 'lang/language.dart';
import 'profile_preview.dart';
import 'ticketPreview.dart';
import 'card_recharge_preview.dart';
import 'color_collection.dart';
import 'map.dart';
import 'translations/locale_keys.g.dart';

class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "English", "en"),
      Language(2, "ಕನ್ನಡ", "kn"),
    ];
  }
}

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
    CardRechargePreview(),
    ProfilePreview(),
    LogoutPreview(),
    HomePreview()
  ];

  List isSelected = [true, false, false, false, false, false, false];

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
        // Positioned(
        //   top: 35.0,
        //   left: 6.0,
        //   child: ElevatedButton(
        //     child: Text(
        //       LocaleKeys.Logout.tr(),
        //       style: TextStyle(
        //           color: Colors.grey.shade600,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 18),
        //     ),
        //     style: ElevatedButton.styleFrom(primary: Colors.green.shade100),
        //     onPressed: () {
        //       Navigator.of(context).pushNamed('/loginpage');
        //     },
        //   ),
        // ),
        Positioned(
          top: screenHeight - (screenHeight - 100.0),
          left: (screenWidth / 4) + 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Welcome.tr(),
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              /*Text(
                'What would you like to do?',
                style: TextStyle(color: Colors.grey[700], fontSize: 15.0),
              ),*/
              DropdownButton<Language>(
                //underline: SizedBox(),
                hint: Text(
                  LocaleKeys.Language.tr(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (Language? language) {
                  context.setLocale(Locale(language!.languageCode));
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[Text(e.name)],
                        ),
                      ),
                    )
                    .toList(),
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
          height: MediaQuery.of(context).size.width / 4.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotatedBox(
                  quarterTurns: 1,
                  child: buildOption(LocaleKeys.Logout.tr(), 4)),
              RotatedBox(
                  quarterTurns: 1, child: buildOption(LocaleKeys.Map.tr(), 1)),
              RotatedBox(
                  quarterTurns: 1, child: buildOption(LocaleKeys.Card.tr(), 2)),
              RotatedBox(
                  quarterTurns: 1,
                  child: buildOption(LocaleKeys.Profile.tr(), 3)),
              RotatedBox(
                  quarterTurns: 1,
                  child: buildOption(LocaleKeys.Ticekts.tr(), 0)),
              RotatedBox(
                  quarterTurns: 1,
                  child: buildOption(LocaleKeys.HomePreviewOption.tr(), 5)),
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

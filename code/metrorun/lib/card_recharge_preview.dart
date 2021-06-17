import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'header_design.dart';
import 'package:url_launcher/url_launcher.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CardRechargePreview extends StatefulWidget {
  @override
  _CardRechargePreviewState createState() => _CardRechargePreviewState();
}

class _CardRechargePreviewState extends State<CardRechargePreview> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),

                  new RaisedButton(
                    onPressed: _launchURL,
                    child: new Text(
                      LocaleKeys.Recharge_metro_card.tr()),
                  ),
                  // Link(
                  //     uri: Uri.parse(
                  //         "https://paytm.com/metro-card-recharge/bengaluru-metro"),
                  //     target: LinkTarget.self,
                  //     builder: (context, followLink) {
                  //       return TextButton(
                  //           onPressed: followLink,
                  //           child: Text(
                  //             "Recharge Metro Card",
                  //             style: TextStyle(color: Colors.green.shade800),
                  //           ));
                  //     }),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://paytm.com/metro-card-recharge/bengaluru-metro';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//         body: Stack(
//       children:

//        <Widget>[

//         Container(

//             child: Align(
//           alignment: Alignment.topCenter,
//           child: Image.asset("assets/MetroRunLogo.png"),
//         )),
//         AnimatedPositioned(
//             duration: Duration(milliseconds: 300),
//             left: opened
//                 ? MediaQuery.of(context).size.width / 2 + 90.0
//                 : (MediaQuery.of(context).size.width / 2) - 90.0,
//             top: opened
//                 ? (MediaQuery.of(context).size.height / 2) - 40.0
//                 : (MediaQuery.of(context).size.height / 2) - 110.0,
//             child: _buildOption(
//                 Icon(Icons.account_balance, color: Colors.white),
//                 Colors.green.shade700)),
//         AnimatedPositioned(
//             duration: Duration(milliseconds: 300),
//             left: opened
//                 ? MediaQuery.of(context).size.width / 2 + 90.0
//                 : (MediaQuery.of(context).size.width / 2) - 130.0,
//             top: (MediaQuery.of(context).size.height / 2) - 30.0,
//             child: _buildOption(
//                 Icon(Icons.monetization_on_sharp, color: Colors.white),
//                 Colors.green.shade700)),
//         AnimatedPositioned(
//           duration: Duration(milliseconds: 300),
//           left: opened
//               ? MediaQuery.of(context).size.width / 2 + 90.0
//               : MediaQuery.of(context).size.width / 2 - 50.0,
//           top: opened
//               ? (MediaQuery.of(context).size.height / 2)
//               : (MediaQuery.of(context).size.height / 2) - 30.0,
//           child: _buildOption(
//               Icon(Icons.add, color: Colors.white), Colors.green.shade700),
//         ),
//         Align(
//           alignment: Alignment.center,
//           child: AnimatedSwitcher(
//             duration: Duration(milliseconds: 200),
//             transitionBuilder: (Widget child, Animation<double> animation) {
//               return ScaleTransition(child: child, scale: animation);
//             },
//             child: opened
//                 ? InkWell(
//                     key: UniqueKey(),
//                     child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Container(
//                             height: 50.0,
//                             width: 120.0,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(40.0),
//                                 color: kPrimaryColor),
//                             child: Center(
//                                 child: TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Book tickets',
//                                 style: TextStyle(color: Colors.green[800]),
//                               ),
//                             )))),
//                     onTap: () {
//                       setState(() {
//                         opened = false;
//                       });
//                     })
//                 : InkWell(
//                     key: UniqueKey(),
//                     child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Container(
//                             height: 80.0,
//                             width: 80.0,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(40.0),
//                                 color: Colors.green[200]),
//                             child: Center(
//                                 child:

//                                     Icon(Icons.close, color: Colors.white)))),
//                     onTap: () {
//                       setState(() {
//                         opened = true;
//                       });
//                     }),
//           ),
//         )
//       ],
//     ));
//   }

//   Widget _buildOption(Icon icon, Color iconColor) {
//     return AnimatedSwitcher(
//         duration: Duration(milliseconds: 500),
//         transitionBuilder: (Widget child, Animation<double> animation) {
//           return RotationTransition(child: child, turns: animation);
//         },
//         child: InkWell(
//           key: UniqueKey(),
//           child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Container(
//                   height: 50.0,
//                   width: 50.0,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25.0),
//                       color: iconColor),
//                   child: Center(child: icon))),
//           onTap: () {
//             setState(() {
//               opened = false;
//             });
//           },
//         ));
//   }
// }

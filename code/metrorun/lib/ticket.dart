import 'package:flutter/foundation.dart';
import 'package:metrorun/constants.dart';
import 'header_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'payment.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class Ticket extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String? from_station, to_station;
  // ignore: non_constant_identifier_names
  int? from_index, to_index;
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  Ticket({this.from_station, this.to_station, this.from_index, this.to_index});
  //Constructor
  TicketState createState() => TicketState(
      from_station: from_station,
      to_station: to_station,
      from_index: from_index,
      to_index: to_index);
}

class TicketState extends State<Ticket> {
  //Variables to display the time and date when the ticket is bought.
  static DateTime date = DateTime.now();
  static TimeOfDay time = TimeOfDay.now();
  final String currenttime = '${time.hour}:${time.minute}';
  final String currentdate = '${date.day}/${date.month}/${date.year}';

  // ignore: non_constant_identifier_names
  var from_station, to_station;
  // ignore: non_constant_identifier_names
  var from_index, to_index, numStops;
  late double amount;

  TicketState(
      // ignore: non_constant_identifier_names
      {this.from_station,
      // ignore: non_constant_identifier_names
      this.to_station,
      // ignore: non_constant_identifier_names
      this.from_index,
      // ignore: non_constant_identifier_names
      this.to_index});

  // ignore: must_call_super
  void initState() {
    var greenDown = [
      LocaleKeys.Yelachenahalli.tr(),
      LocaleKeys.Jayaprakash_Nagar.tr(),
      LocaleKeys.Banashankari.tr(),
      LocaleKeys.Rashtriya_Vidyalaya_Road.tr(),
      LocaleKeys.Jayanagar.tr(),
      LocaleKeys.South_End_Circle.tr(),
      LocaleKeys.Lalbagh.tr(),
      LocaleKeys.National_College.tr(),
      LocaleKeys.KRMarket.tr(),
      LocaleKeys.Chickpete.tr(),
      LocaleKeys.Nadaprabhu_Kempegowda_Station_Majestic.tr(),
    ];

    var greenTop = [
      LocaleKeys.Nadaprabhu_Kempegowda_Station_Majestic.tr(),
      LocaleKeys.Mantri_Square_Sampige_Road.tr(),
      LocaleKeys.Srirampura.tr(),
      LocaleKeys.Kuvempu_Road.tr(),
      LocaleKeys.Rajajinagar.tr(),
      LocaleKeys.Mahalakshmi_layout.tr(),
      LocaleKeys.Sandal_Soap_Factor.tr(),
      LocaleKeys.Yeshwantpur.tr(),
      LocaleKeys.Gorguntepalya.tr(),
      LocaleKeys.Peenya.tr(),
      LocaleKeys.Peenya_Industry.tr(),
      LocaleKeys.Jalahalli.tr(),
      LocaleKeys.Dasarahalli.tr(),
      LocaleKeys.Nagasandra.tr()
    ];

    var purpleRight = [
      LocaleKeys.Baiyyappanahalli.tr(),
      LocaleKeys.Swami_Vivekananda_Road.tr(),
      LocaleKeys.Indiranagar.tr(),
      LocaleKeys.Halasuru.tr(),
      LocaleKeys.Trinity.tr(),
      LocaleKeys.Mahatma_Gandhi_Road.tr(),
      LocaleKeys.Cubbon_Park.tr(),
      LocaleKeys.Vidhana_Soudha.tr(),
      LocaleKeys.Sir_M_Vishweshwarayya_Central_College.tr(),
      LocaleKeys.Nadaprabhu_Kempegowda_Majestic.tr(),
    ];

    var purpleLeft = [
      LocaleKeys.Nadaprabhu_Kempegowda_Majestic.tr(),
      LocaleKeys.KSR_City_Railway_Statio.tr(),
      LocaleKeys.Magadi_Road.tr(),
      LocaleKeys.Hosahalli.tr(),
      LocaleKeys.Vijayanagar.tr(),
      LocaleKeys.Attiguppe.tr(),
      LocaleKeys.Deepanjali_Nagar.tr(),
      LocaleKeys.Mysuru_Road.tr()
    ];

    int counter = 0, i = 0, from = 0, to = 0;

    if (from_station == to_station) {
      amount = 0.0;
      print(amount);
    } else {
      if (greenLine.contains(from_station) && purpleLine.contains(to_station)) {
        if (greenTop.contains(from_station)) {
          for (i = 0; i < greenTop.length; i++) {
            if (greenTop[i] == from_station) {
              from = i;
              numStops = from;

              if (purpleRight.contains(to_station)) {
                for (i = 0; i < purpleRight.length; i++) {
                  if (purpleRight[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }

              if (purpleLeft.contains(to_station)) {
                for (i = 0; i < purpleLeft.length; i++) {
                  if (purpleLeft[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }
            }
          }

          if (greenDown.contains(from_station)) {
            for (i = 0; i < greenDown.length; i++) {
              if (greenDown[i] == from_station) {
                from = i;
                numStops = from;

                if (purpleRight.contains(to_station)) {
                  for (i = 0; i < purpleRight.length; i++) {
                    if (purpleRight[i] == to_station) {
                      to = i;
                      counter = from + to;
                      if (counter == 1) {
                        amount = (10.00);
                      } else
                        amount = (1 + (counter / 2) * 5.00);
                    }
                  }
                }

                if (purpleLeft.contains(to_station)) {
                  for (i = 0; i < purpleLeft.length; i++) {
                    if (purpleLeft[i] == to_station) {
                      to = i;
                      counter = from + to;
                      if (counter == 1) {
                        amount = (10.00);
                      } else
                        amount = (1 + (counter / 2) * 5.00);
                    }
                  }
                }
              }
            }
          }
        }
      } // green from, purple to

      if (purpleLine.contains(from_station) && greenLine.contains(to_station)) {
        if (purpleRight.contains(from_station)) {
          for (i = 0; i < purpleRight.length; i++) {
            if (purpleRight[i] == from_station) {
              from = i;
              numStops = from;
              print(numStops);

              if (greenTop.contains(to_station)) {
                for (i = 0; i < greenTop.length; i++) {
                  if (greenTop[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }
              if (greenDown.contains(to_station)) {
                for (i = 0; i < greenDown.length; i++) {
                  if (greenDown[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }
            }
          }
        }

        if (purpleLeft.contains(from_station)) {
          for (i = 0; i < purpleLeft.length; i++) {
            if (purpleLeft[i] == from_station) {
              from = i;
              numStops = from;

              if (greenTop.contains(to_station)) {
                for (i = 0; i < greenTop.length; i++) {
                  if (greenTop[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }
              if (greenDown.contains(to_station)) {
                for (i = 0; i < greenDown.length; i++) {
                  if (greenDown[i] == to_station) {
                    to = i;
                    counter = from + to;
                    if (counter == 1) {
                      amount = (10.00);
                    } else
                      amount = (1 + (counter / 2) * 5.00);
                  }
                }
              }
            }
          }
        }
        // purple from, green to
        else {
          if (((to_index - from_index).abs()) == 1) {
            amount = (10.00);
          } else {
            amount = ((1 + (((to_index - from_index).abs()) / 2)) * 5.00);
          }
        }
      }

      //amount = ((1 + ((to_index - from_index).abs())) * 5.0);
      print(amount);
    }
  }

  //Metro Routes
  var purpleLine = [
    LocaleKeys.Baiyyappanahalli.tr(),
    LocaleKeys.Swami_Vivekananda_Road.tr(),
    LocaleKeys.Indiranagar.tr(),
    LocaleKeys.Halasuru.tr(),
    LocaleKeys.Trinity.tr(),
    LocaleKeys.Mahatma_Gandhi_Road.tr(),
    LocaleKeys.Cubbon_Park.tr(),
    LocaleKeys.Vidhana_Soudha.tr(),
    LocaleKeys.Sir_M_Vishweshwarayya_Central_College.tr(),
    LocaleKeys.Nadaprabhu_Kempegowda_Majestic.tr(),
    LocaleKeys.KSR_City_Railway_Statio.tr(),
    LocaleKeys.Magadi_Road.tr(),
    LocaleKeys.Hosahalli.tr(),
    LocaleKeys.Vijayanagar.tr(),
    LocaleKeys.Attiguppe.tr(),
    LocaleKeys.Deepanjali_Nagar.tr(),
    LocaleKeys.Mysuru_Road.tr()
  ];

  var greenLine = [
    LocaleKeys.Yelachenahalli.tr(),
    LocaleKeys.Jayaprakash_Nagar.tr(),
    LocaleKeys.Banashankari.tr(),
    LocaleKeys.Rashtriya_Vidyalaya_Road.tr(),
    LocaleKeys.Jayanagar.tr(),
    LocaleKeys.South_End_Circle.tr(),
    LocaleKeys.Lalbagh.tr(),
    LocaleKeys.National_College.tr(),
    LocaleKeys.KRMarket.tr(),
    LocaleKeys.Chickpete.tr(),
    LocaleKeys.Nadaprabhu_Kempegowda_Station_Majestic.tr(),
    LocaleKeys.Mantri_Square_Sampige_Road.tr(),
    LocaleKeys.Srirampura.tr(),
    LocaleKeys.Kuvempu_Road.tr(),
    LocaleKeys.Rajajinagar.tr(),
    LocaleKeys.Mahalakshmi_layout.tr(),
    LocaleKeys.Sandal_Soap_Factor.tr(),
    LocaleKeys.Yeshwantpur.tr(),
    LocaleKeys.Gorguntepalya.tr(),
    LocaleKeys.Peenya.tr(),
    LocaleKeys.Peenya_Industry.tr(),
    LocaleKeys.Jalahalli.tr(),
    LocaleKeys.Dasarahalli.tr(),
    LocaleKeys.Nagasandra.tr()
  ];

  //Aesthetics of the ticket screen
  @override
  Widget build(BuildContext context) {
    var ticketdisplay = Ticketdisplay(
      innerRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)),
      outerRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.0),
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: kPrimaryColor,
        )
      ],
      child: Image.asset(
        'assets/nammaMetro.png',
      ),
    );

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        title: Text(
          LocaleKeys.Hereticket.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
            color: Colors.purple[800],
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
          child: Container(
            width: 330,
            child: ListView(
              children: <Widget>[
                ticketdisplay,
                Ticketdisplay(
                  innerRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  outerRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      color: Color.fromRGBO(196, 196, 196, .76),
                    )
                  ],
                  child: Container(
                    color: Colors.white,
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Divider(height: 0.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      LocaleKeys.Date.tr(),
                                      style: TextStyle(
                                          color: Colors.purple[700],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        currentdate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      LocaleKeys.Time.tr(),
                                      style: TextStyle(
                                          color: Colors.green[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(height: 10.0),
                                    FittedBox(
                                      child: Text(
                                        currenttime,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    LocaleKeys.From.tr(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(height: 10.0),
                                  FittedBox(
                                    child: dispStation(from_station),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    LocaleKeys.To.tr(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(height: 10.0),
                                  FittedBox(
                                    child: dispStation(to_station),
                                  ),
                                ],
                              ),
                            )),
                            /* Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'To',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(height: 10.0),
                                  FittedBox(
                                    child: Display(to_station),
                                  ),
                                ],
                              ),
                            )),
                            */
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: switchtext(),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0),
                        Center(
                          child: Text(
                            'Cost : Rs. $amount',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 100, height: 40),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple[700],
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.green, width: 3.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              // color: Colors.purple[700],
                              // splashColor: Colors.purpleAccent,
                              child: Text(LocaleKeys.Pay.tr(),
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.green[200],
                                    fontWeight: FontWeight.w500,
                                  )),
                              onPressed: () {
                                sendAmount(amount);
                                print("Amount Paid : $amount\n");
                                myAmount = amount;
                                Navigator.of(context).pushNamed('/paymentPage');
                                // Navigator.of(context).pushNamed('/qrcodepage');
                                /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QRCode()));*/
                              }),
                        ),
                        SizedBox(height: 10.0)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  dispStation(String station) {
    if (greenLine.contains(station)) {
      return Text(
        station,
        style: TextStyle(
          color: Colors.green[600],
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (purpleLine.contains(station)) {
      return Text(
        station,
        style: TextStyle(
          color: Colors.purple[700],
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  switchtext() {
    if (greenLine.contains(from_station) && purpleLine.contains(to_station)) {
      return Text(
        'Switch lines after $numStops stops at Kempegowda Majestic',
        style: TextStyle(
          color: Colors.green[600],
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      );
    } else if (purpleLine.contains(from_station) &&
        greenLine.contains(to_station)) {
      return Text(
        'Switch lines after $numStops stops at Kempegowda Majestic',
        style: TextStyle(
          color: Colors.purple,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      );
    } else {
      return Container(
        child: SizedBox(height: 0.0),
      );
    }
  }
}

class Ticketdisplay extends StatelessWidget {
  const Ticketdisplay(
      {Key? key,
      this.innerRadius = const BorderRadius.all(Radius.circular(0.0)),
      this.outerRadius = const BorderRadius.all(Radius.circular(0.0)),
      required this.child,
      this.boxShadow = const [],
      this.dashedBottom = false})
      : super(key: key);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  final List<BoxShadow> boxShadow;

  final bool dashedBottom;

  /// The [child] contained by the ticket widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: TicketClipper(innerRadius, outerRadius),
      boxShadow: boxShadow,
      child: child,
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper(this.innerRadius, this.outerRadius);

  final BorderRadius innerRadius;

  final BorderRadius outerRadius;

  @override
  Path getClip(Size size) {
    /// approximation to a circular arc
    const C = 0.551915024494;
    final path = Path();

    var currentUseInner = false;
    var currentRadius = Radius.circular(0.0);

    currentUseInner = innerRadius.topLeft != Radius.circular(0.0);
    currentRadius = currentUseInner ? innerRadius.topLeft : outerRadius.topLeft;
    path.moveTo(0.0, currentRadius.y);
    path.cubicTo(
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentRadius.x,
        0.0);

    currentUseInner = innerRadius.topRight != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.topRight : outerRadius.topRight;
    path.lineTo(size.width - currentRadius.x, 0.0);
    path.cubicTo(
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? currentRadius.y * C : 0.0,
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner ? currentRadius.y : currentRadius.y * (1 - C),
        size.width,
        currentRadius.y);

    currentUseInner = innerRadius.bottomRight != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomRight : outerRadius.bottomRight;
    path.lineTo(size.width, size.height - currentRadius.y);
    path.cubicTo(
        currentUseInner ? size.width - currentRadius.x * C : size.width,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        currentUseInner
            ? size.width - currentRadius.x
            : size.width - currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        size.width - currentRadius.x,
        size.height);

    currentUseInner = innerRadius.bottomLeft != Radius.circular(0.0);
    currentRadius =
        currentUseInner ? innerRadius.bottomLeft : outerRadius.bottomLeft;
    path.lineTo(currentRadius.x, size.height);
    path.cubicTo(
        currentUseInner ? currentRadius.x : currentRadius.x * (1 - C),
        currentUseInner ? size.height - currentRadius.y * C : size.height,
        currentUseInner ? currentRadius.x * C : 0.0,
        currentUseInner
            ? size.height - currentRadius.y
            : size.height - currentRadius.y * (1 - C),
        0.0,
        size.height - currentRadius.y);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _ClipShadowPainter extends CustomPainter {
  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> clipShadow;

  _ClipShadowPainter({required this.clipper, required this.clipShadow});

  @override
  void paint(Canvas canvas, Size size) {
    clipShadow.forEach((BoxShadow shadow) {
      var paint = shadow.toPaint();
      var spreadSize = Size(size.width + shadow.spreadRadius * 2,
          size.height + shadow.spreadRadius * 2);
      var clipPath = clipper.getClip(spreadSize).shift(Offset(
          shadow.offset.dx - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius));
      canvas.drawPath(clipPath, paint);
//      canvas.drawShadow(clipper.getClip(size), shadow.color, shadow.spreadRadius, true);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow extends StatelessWidget {
  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// If non-null, determines which clip to use.
  final CustomClipper<Path> clipper;

  /// The [Widget] below this widget in the tree.
  final Widget child;

  ClipShadow(
      {required this.boxShadow, required this.clipper, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(clipShadow: boxShadow, clipper: clipper),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  debugFillProperties(properties);
  Object? top;
  properties.add(DiagnosticsProperty('top', top));
}

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
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 150, height: 150),
                    child: ElevatedButton(
                      child: Text(
                        LocaleKeys.Recharge_metro_card.tr(),
                        style:
                            TextStyle(fontSize: 18, color: Colors.green[900]),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: _launchURL,
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          side: BorderSide(
                              color: Colors.green.shade200, width: 3.0),
                          primary: Colors.white),
                    ),
                  ),
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

  _launchURL() {
    const url = 'https://paytm.com/metro-card-recharge/bengaluru-metro';
    launch(url);
  }
}

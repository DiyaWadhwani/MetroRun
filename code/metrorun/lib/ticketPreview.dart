import 'package:flutter/material.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TicketPreview extends StatefulWidget {
  @override
  _TicketPreviewState createState() => _TicketPreviewState();
}

class _TicketPreviewState extends State<TicketPreview> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    // Color color;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100, height: 100),
              child: ElevatedButton(
                child: Text(
                  LocaleKeys.Book_Tickets.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.green[900]),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/bookingpage');
                },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.green.shade200, width: 3.0),
                    primary: Colors.white),
              ),
            ),
            SizedBox(height: 50.0),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100, height: 100),
              child: ElevatedButton(
                child: Text(
                  LocaleKeys.View_Active_Ticket.tr(),
                  style: TextStyle(fontSize: 18, color: Colors.green[900]),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/ridespage');
                },
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    side: BorderSide(color: Colors.green.shade200, width: 3.0),
                    primary: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

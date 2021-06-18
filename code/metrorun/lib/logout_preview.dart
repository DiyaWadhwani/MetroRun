import 'package:flutter/material.dart';
import 'auth.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'lang/language.dart';

class LogoutPreview extends StatefulWidget {
  @override
  _LogoutPreviewState createState() => _LogoutPreviewState();
}

class _LogoutPreviewState extends State<LogoutPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 200, height: 200),
          child: ElevatedButton(
            child: Text(
              LocaleKeys.LogoutPreview.tr(),
              style: TextStyle(fontSize: 18, color: Colors.green[900]),
              textAlign: TextAlign.center,
            ),
            onPressed: () async {
              await signOutWithGoogle();
              print('User signed out');
              print("Heading to login_page");
              Navigator.of(context).pushNamed('/loginpage');
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                side: BorderSide(color: Colors.green.shade200, width: 3.0),
                primary: Colors.white),
          ),
        ),
      ),
    );
  }
}

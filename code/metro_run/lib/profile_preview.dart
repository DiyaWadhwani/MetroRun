import 'package:flutter/material.dart';

class ProfilePreview extends StatefulWidget {
  @override
  _ProfilePreviewState createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/profilepage');
        },
        child: Icon(
          Icons.face_retouching_natural,
          color: Colors.green[800],
        ),
      ),
    );
  }
}

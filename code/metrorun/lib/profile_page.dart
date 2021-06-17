import 'package:flutter/material.dart';
import 'auth.dart';
import 'constants.dart';
import 'translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homepage');
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.purple[700]),
        ),
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.purple[700]!.withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 400.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 0.0),
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(myPhotoUrl),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 7.0,
                                  color: Colors.purple.shade900)
                            ])),
                    SizedBox(height: 30.0),
                    Text(
                      myName,
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[800]),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      LocaleKeys.Premium_user.tr(),
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purple[900],
                          color: Colors.purple[50],
                          elevation: 5.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                LocaleKeys.Edit_profile.tr(),
                                style: TextStyle(
                                    color: Colors.purple[700],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: 40.0),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.purple[900],
                          color: Colors.purple[50],
                          elevation: 7.0,
                          child: OutlinedButton(
                            onPressed: () async {
                              await signOutWithGoogle();
                              print('User signed out');
                              print("Heading to login_page");
                              Navigator.of(context).pushNamed('/loginpage');
                            },
                            child: Center(
                              child: Text(
                                LocaleKeys.Logout.tr(),
                                style: TextStyle(
                                    color: Colors.purple[700],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            style: ButtonStyle(),
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

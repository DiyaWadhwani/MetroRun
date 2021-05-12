import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.green[700].withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(''), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.green[900])
                        ])),
                SizedBox(height: 30.0),
                Text(
                  'Meghana Bhat',
                  style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Premium User',
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
                      shadowColor: Colors.green[900],
                      color: Colors.green[50],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 40.0),
                Container(
                    height: 40.0,
                    width: 120.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.green[900],
                      color: Colors.green[50],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/ridespage');
                        },
                        child: Center(
                          child: Text(
                            'View previous rides',
                            style: TextStyle(
                                color: Colors.green[700],
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
                      shadowColor: Colors.green[900],
                      color: Colors.green[50],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/homepage');
                        },
                        child: Center(
                          child: Text(
                            'Home',
                            style: TextStyle(
                                color: Colors.green[700],
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
                      shadowColor: Colors.green[900],
                      color: Colors.green[50],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
    // TODO: implement shouldReclip
    return true;
  }
}

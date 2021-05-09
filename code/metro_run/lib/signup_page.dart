import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  String email;
  String password;

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
            backgroundColor: Colors.purple[50],
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, animation.value * height, 0.0),
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(15.0, 100.0, 0, 0),
                            child: Text(
                              'Create an account,',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(15.0, 150.0, 0, 0),
                            child: Text(
                              'And Metro Run.',
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple[800]),
                            )),
                      ],
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(hintText: 'Email'),
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(hintText: 'Username'),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(hintText: 'Phone number'),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 15.0),
                        TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.0),
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'All set? Board the train, jee le apni zindagi.',
                                style: TextStyle(
                                    color: Colors.purple[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                  child: Text('Sign Up'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    primary: Colors.purple[700],
                                    onPrimary: Colors.black,
                                    shadowColor: Colors.deepPurple,
                                    elevation: 7.0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/loginpage');
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

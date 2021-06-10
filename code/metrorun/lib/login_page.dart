import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metrorun/auth.dart';
import 'package:metrorun/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late String email;
  late String password;

  User? user;

  late Animation animation, delayedAnimation, muchDelayedAnimation;
  late AnimationController animationController;

  @override
  void initState() {
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

    // signInWithGoogle().whenComplete(() {
    //   setState(() {
    //     this.user = user;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        // ignore: non_constant_identifier_names
        builder: (BuildContext context, Widget) {
          return new Scaffold(
            backgroundColor: Colors.green[100],
            resizeToAvoidBottomInset: false,
            body: Container(
              margin: EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 0.8],
                  colors: [
                    Colors.green.shade200,
                    Colors.deepPurpleAccent.shade400,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(
                        0.0, animation.value * height, 0.0),
                    child: Container(
                      child: Stack(
                        children: [
                          SizedBox(height: 50.0),
                          Container(
                              padding: EdgeInsets.fromLTRB(15.0, 100.0, 0, 0),
                              child: Text(
                                'Hey',
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 65.0,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(16.0, 175.0, 0, 0),
                              child: Text(
                                'There',
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 65.0,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(190.0, 175.0, 0, 0),
                              child: Text(
                                '!',
                                style: TextStyle(
                                    fontSize: 65.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800]),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * width, 0.0, 0.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 150.0),
                          Text(
                            'New to MetroRun?',
                            style: TextStyle(
                              color: Colors.deepPurple.shade900,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Text(
                            'Sign up to create a new account',
                            style: TextStyle(
                              color: Colors.green.shade200,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.green.shade200,
                              fontSize: 20.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0.0, 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                googleLoginButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: () {
        print("Google login button clicked");
        this.user = user;
        signInWithGoogle().then((user) => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
            });
      },
      style: OutlinedButton.styleFrom(
          // primary: Colors.grey.shade100,
          backgroundColor: Colors.green.shade200,
          shadowColor: Colors.red,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(45)),
          )),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/google_logo.png'),
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Sign in with Google',
                    style: TextStyle(
                      color: Colors.deepPurple.shade800,
                      fontSize: 20,
                    )),
              )
            ],
          )),
    );
  }
}

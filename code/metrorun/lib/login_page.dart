import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late String email;
  late String password;

  late Animation animation, delayedAnimation, muchDelayedAnimation;
  late AnimationController animationController;

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
        builder: (BuildContext context, Widget) {
          return new Scaffold(
            backgroundColor: Colors.green[100],
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, animation.value * height, 0.0),
                  child: Container(
                    child: Stack(
                      children: [
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
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'Email/Username'),
                          onChanged: (value) {
                            setState(() {
                              email = value;
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
                        ElevatedButton(
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green[700],
                              onPrimary: Colors.black,
                              elevation: 7.0,
                              shadowColor: Colors.green[900],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/homepage');
                            }),
                        SizedBox(height: 25.0),
                        Transform(
                          transform: Matrix4.translationValues(
                              muchDelayedAnimation.value * width, 0.0, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'New to MetroRun? Sign up, create an account!',
                                style: TextStyle(color: Colors.black45),
                              ),
                              SizedBox(height: 10.0),
                              ElevatedButton(
                                  child: Text('Sign Up'),
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      primary: Colors.green[700],
                                      onPrimary: Colors.black,
                                      elevation: 7.0,
                                      shadowColor: Colors.green[900]),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/signup');
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

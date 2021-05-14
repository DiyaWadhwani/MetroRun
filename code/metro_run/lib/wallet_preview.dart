import 'package:flutter/material.dart';

class WalletPreview extends StatefulWidget {
  @override
  _WalletPreviewState createState() => _WalletPreviewState();
}

class _WalletPreviewState extends State<WalletPreview> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Tap to view your wallet.',
              style: TextStyle(
                  color: Colors.green[800], fontWeight: FontWeight.bold),
            ),
          ),
        ),
        AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 + 90.0
                : (MediaQuery.of(context).size.width / 2) - 90.0,
            top: opened
                ? (MediaQuery.of(context).size.height / 2) - 40.0
                : (MediaQuery.of(context).size.height / 2) - 110.0,
            child: _buildOption(
                Icon(Icons.account_balance, color: Colors.white),
                Colors.green[700])),
        AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: opened
                ? MediaQuery.of(context).size.width / 2 + 90.0
                : (MediaQuery.of(context).size.width / 2) - 130.0,
            top: (MediaQuery.of(context).size.height / 2) - 30.0,
            child: _buildOption(
                Icon(Icons.monetization_on_sharp, color: Colors.white),
                Colors.green[700])),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: opened
              ? MediaQuery.of(context).size.width / 2 + 90.0
              : MediaQuery.of(context).size.width / 2 - 50.0,
          top: opened
              ? (MediaQuery.of(context).size.height / 2)
              : (MediaQuery.of(context).size.height / 2) - 30.0,
          child: _buildOption(
              Icon(Icons.add, color: Colors.white), Colors.green[700]),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: opened
                ? InkWell(
                    key: UniqueKey(),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 50.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.green[700]),
                            child: Center(
                                child: Icon(Icons.wallet_giftcard,
                                    color: Colors.white)))),
                    onTap: () {
                      setState(() {
                        opened = false;
                      });
                    })
                : InkWell(
                    key: UniqueKey(),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.green[200]),
                            child: Center(
                                child:
                                    Icon(Icons.close, color: Colors.white)))),
                    onTap: () {
                      setState(() {
                        opened = true;
                      });
                    }),
          ),
        )
      ],
    ));
  }

  Widget _buildOption(Icon icon, Color iconColor) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(child: child, turns: animation);
        },
        child: InkWell(
          key: UniqueKey(),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: iconColor),
                  child: Center(child: icon))),
          onTap: () {
            setState(() {
              opened = false;
            });
          },
        ));
  }
}

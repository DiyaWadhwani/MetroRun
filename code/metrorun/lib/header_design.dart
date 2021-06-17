import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'translations/locale_keys.g.dart';

final double kDefaultPadding = 5.0;
final kPrimaryColor = Color(0xFFA5D6A7);

class HeaderDesign extends StatelessWidget {
  const HeaderDesign({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      // It will cover 15% of our total height
      height: size.height * 0.13,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: 5 + kDefaultPadding,
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 5 + kDefaultPadding,
            ),
            height: size.height * 13,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Text(
                  LocaleKeys.Select_your_route.tr(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(width: 20.0),
                Image.asset("assets/MetroRunLogo.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

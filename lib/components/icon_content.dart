import 'package:flutter/material.dart';
import 'costants.dart';


class CardContent extends StatelessWidget {
  CardContent({this.iconType, this.label});

  final IconData iconType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

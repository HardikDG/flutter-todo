import 'package:flutter/material.dart';

class InfoHeader extends StatelessWidget {
  final String title;
  final Color textColor;

  InfoHeader({this.title, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: textColor,
        ));
  }
}

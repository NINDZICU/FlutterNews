import 'package:flutter/material.dart';


class ItemHeaderText extends StatelessWidget {
  final String text;

  ItemHeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, height: 1.3),
    );
  }
}
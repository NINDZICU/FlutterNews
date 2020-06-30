import 'package:flutter/material.dart';

class BlackIcon extends StatelessWidget {
  final IconData icon;

  BlackIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.black);
  }
}

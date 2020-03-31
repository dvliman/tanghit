import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader({this.color = Colors.white});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(backgroundColor: color),
    );
  }
}

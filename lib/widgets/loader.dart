import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color color;

  Loader({this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(backgroundColor: this.color),
    );
  }
}

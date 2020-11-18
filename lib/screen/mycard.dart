import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  static const String routename = 'MyCards';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cards"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomRaisedbutton extends StatelessWidget {
  final String text;
  final Function onpressed;
  BottomRaisedbutton({this.text, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onpressed,
      child: Text(
        text,
      ),
      elevation: 5.0,
    );
  }
}

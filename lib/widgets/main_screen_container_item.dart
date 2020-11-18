import 'package:flutter/material.dart';

class HomescreenItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 180.0,
        child: Card(
          child: Text('items'),
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
    );
  }
}

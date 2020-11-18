import 'package:flutter/material.dart';
import 'package:grk_001/screen/product_overview_screen.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;
   const CategoryItems(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.0),
      splashColor: color,
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routename);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}

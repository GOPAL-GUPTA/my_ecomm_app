import 'package:flutter/material.dart';
import 'package:grk_001/Data/category_screen_data.dart';
import 'package:grk_001/widgets/category_items.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25.0),
      children:
          CategoryItemsData.map((cat) => CategoryItems(cat.title, cat.color))
              .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}

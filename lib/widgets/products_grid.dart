import 'package:flutter/material.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/widgets/product_items.dart';
import 'package:provider/provider.dart';

class Products_grid extends StatelessWidget {
  final bool showfavourite;
  Products_grid(this.showfavourite);
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products =
        showfavourite ? productsdata.FavouriteItems : productsdata.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItems(
//            id: productsdata.items[i].id,
//            imageUrl: productsdata.items[i].imageUrl,
//            title: productsdata.items[i].title,
              ),
        );
      },
      itemCount: products.length,
    );
  }
}

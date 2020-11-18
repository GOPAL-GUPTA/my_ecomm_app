import 'package:flutter/material.dart';
import 'package:grk_001/screen/product_details_screen.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/cart.dart';

class ProductItems extends StatelessWidget {
//  final String title;
//  final String imageUrl;
//  final String id;
//  ProductItems({this.imageUrl, this.id, this.title});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Theme(
      data: ThemeData(fontFamily: 'RobotoCondensed'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ProductDetails.routename, arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            decoration: BoxDecoration(
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.grey,
//                  blurRadius: 10.0,
//                  spreadRadius: 1.0,
//                ),
//              ],
                ),
            child: GridTileBar(
              backgroundColor: Colors.black87, //Color(0X70FF4081),
              leading: Consumer<Product>(
                builder: (context, product, _) => IconButton(
                  onPressed: () {
                    product.toggleisFavourite();
                  },
                  icon: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  cart.addItem(
                      product.id == null ? '' : product.id,
                      product.title == null ? '' : product.title,
                      product.price == null ? '' : product.price);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Added item to the cart',
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          cart.removesingleitem(product.id);
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart, color: Colors.deepOrange),
              ),
              title: Text(
                product.title == null ? '' : product.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

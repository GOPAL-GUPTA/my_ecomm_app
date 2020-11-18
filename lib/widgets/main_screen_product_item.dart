import 'package:flutter/material.dart';
import 'package:grk_001/Provider/product.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/screen/product_details_screen.dart';

class Item extends StatelessWidget {
//  String id;
//  String title;
//  String imageurl;
  Item();
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routename, arguments: prod.id);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    prod.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: Container(
                  height: 30.0,
                  child: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(
                      prod.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('Shop Now'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grk_001/Provider/cart.dart';
import 'package:grk_001/Provider/products.dart';
import 'package:grk_001/screen/cart_screen.dart';
import 'package:grk_001/widgets/badge.dart';

import 'package:grk_001/widgets/products_grid.dart';
import 'package:provider/provider.dart';

enum Filteroption { Favourite, all }

class ProductScreen extends StatefulWidget {
  static const String routename = 'ProductScreen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var isinit = true;
  bool isloading = false;
//  @override
//  void initState() {
//    // WON'T WORK!
//    Future.delayed(Duration.zero).then((_) {
//      Provider.of<Products>(context, listen: false).fetchandsetproduct();
//    });
//    // TODO: implement initState
//    super.initState();
//  }
//
//  @override
//  void didChangeDependencies() {
//    // TODO: implement didChangeDependencies
//    if (isinit) {
//      setState(() {
//        isloading = true;
//      });
//      Provider.of<Products>(context, listen: false)
//          .fetchandsetproduct()
//          .then((_) {
//        setState(() {
//          isloading = false;
//        });
//      });
//    }
//    isinit = false;
//
//    super.didChangeDependencies();
//  }

  var showfav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (Filteroption selectedvalue) {
                setState(() {
                  if (selectedvalue == Filteroption.Favourite) {
                    showfav = true;
                  } else {
                    showfav = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only favourite'),
                  value: Filteroption.Favourite,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: Filteroption.all,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cartdata, ch) => Badge(
                child: ch,
                value: cartdata.itemcount.toString(),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routename);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 40.0,
                ),
              ),
            ),
          ],
          title: Text('product screen'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Products_grid(showfav),
        ));
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grk_001/screen/payment_main_screen.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/products.dart';

class ProductDetails extends StatelessWidget {
  static const String routename = 'ProductDetails';
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    final Productid = ModalRoute.of(context).settings.arguments as String;
    final loadedproduct = Provider.of<Products>(
      context,
    ).findByid(Productid);

    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(loadedproduct.title == null ? '' : loadedproduct.title),
        ),
        body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        loadedproduct.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '₹${loadedproduct.price}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      loadedproduct.description,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.pink,
                              ),
                              label: Text(
                                'Quantity',
                                style: TextStyle(color: Colors.pink),
                              )),
                        ),
                        Expanded(
                          child: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.pink,
                            ),
                            label: Text(
                              'Color',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
//                  Expanded(
//                    flex: 3,
//                    child: FlatButton(
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(0.0),
//                      ),
//                      color: Colors.deepOrange,
//                      onPressed: () {},
//                      child: Text('ADD TO CART'),
//                    ),
//                  ),
                    Expanded(
                        flex: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PaytmPayment.routename);
                          },
                          child: Container(
                            height: 40.0,
                            alignment: Alignment.center,
                            color: Colors.pink,
                            child: Text(
                              'BUY NOW ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
//                      FlatButton(
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(0.0),
//                        ),
//                        color: Colors.pink,
//                        onPressed: () {},
//                        child: Text('BUY NOW'),
//                      ),
                        ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: Icon(
                            Icons.favorite,
                            size: 37.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: Icon(
                            Icons.shopping_cart,
                            size: 37.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grk_001/Provider/cart.dart' show Cart;
import 'package:grk_001/Provider/orders.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String routename = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart Screen'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  Spacer(
                    flex: 20,
                  ),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  ButtonTheme(
                    child: orderbutton(cart: cart),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) => CartItem(
                title: cart.items.values.toList()[i].title,
                id: cart.items.values.toList()[i].id,
                Productid: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}

class orderbutton extends StatefulWidget {
  const orderbutton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _orderbuttonState createState() => _orderbuttonState();
}

class _orderbuttonState extends State<orderbutton> {
  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (widget.cart.totalAmount <= 0 || _isloading)
          ? null
          : () async {
              setState(() {
                _isloading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              setState(() {
                _isloading = false;
              });
              widget.cart.clear();
            },
      child: _isloading
          ? CircularProgressIndicator()
          : Text(
              'OrderNow',
              style: TextStyle(fontSize: 20.0),
            ),
      textColor: (Theme.of(context).primaryColor),
    );
  }
}

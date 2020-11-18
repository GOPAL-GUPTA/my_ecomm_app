import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Provider/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String Productid;
  final String title;
  final double price;
  final int quantity;
  CartItem({this.quantity, this.Productid, this.price, this.title, this.id});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do You want to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              )
            ],
          ),
        );
      },
      background: Container(
        padding: EdgeInsets.only(right: 20.0),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40.0,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removecartitem(Productid);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: FittedBox(
              child: CircleAvatar(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                radius: 40.0,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    '\$$price',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

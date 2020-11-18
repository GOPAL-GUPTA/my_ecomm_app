import 'package:flutter/material.dart';
import 'package:grk_001/Provider/orders.dart' as ord;
import 'package:grk_001/screen/track_order.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('₹${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.datetime),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.products.length * 20.0 + 70, 100),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.order.products[i].title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${widget.order.products[i].quantity}x ₹ ${widget.order.products[i].price} ',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ),
                      itemCount: widget.order.products.length,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'order track',
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Trackorder.routename);
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

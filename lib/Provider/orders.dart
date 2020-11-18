import 'package:flutter/cupertino.dart';
import 'package:grk_001/Provider/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;
  OrderItem({this.id, this.products, this.amount, this.datetime});
}

class Orders with ChangeNotifier {
  final String userid;
  Orders(this.userid, this._orders);
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetandsetdata() async {
    final Url = 'https://grk001-49ab4.firebaseio.com/$userid/orders.json';
    final response = await http.get(Url);
    final extractsdata = json.decode(response.body) as Map<String, dynamic>;
    if (extractsdata == null) {
      return;
    }
    final List<OrderItem> loadedorder = [];
    extractsdata.forEach((orderid, orderdata) {
      loadedorder.add(OrderItem(
        id: orderid,
        amount: orderdata['amount'],
        datetime: DateTime.parse(orderdata['dateTime']),
        products: (orderdata['products'] as List<dynamic>)
            .map((item) => CartItem(
                  productid: item['productid'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price'],
                  id: item['id'],
                ))
            .toList(),
      ));
    });
    _orders = loadedorder.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartproducts, double total) async {
    final Url = 'https://grk001-49ab4.firebaseio.com/$userid/orders.json';
    print(userid);
    final timestamp = DateTime.now();
    final response = await http.post(Url,
        body: json.encode(
          {
            'amount': total,
            'dateTime': timestamp.toIso8601String(),
            'products': cartproducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.title,
                      'quantity': cp.quantity,
                      'price': cp.price,
                      'productid': cp.productid,
                    })
                .toList()
          },
        ));

    _orders.insert(
      0,
      OrderItem(
        products: cartproducts,
        amount: total,
        datetime: timestamp,
        id: json.decode(response.body)['name'],
      ),
    );
    notifyListeners();
  }
}

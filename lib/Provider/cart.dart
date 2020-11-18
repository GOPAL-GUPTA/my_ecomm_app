import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String productid;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.productid,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemcount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;

    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  void removecartitem(String productid) {
    _items.remove(productid);
    notifyListeners();
  }

  void removesingleitem(String Productid) {
    if (!_items.containsKey(Productid)) return;
    if (_items[Productid].quantity > 1) {
      _items.update(
        Productid,
        (existyingCartitem) => CartItem(
          id: existyingCartitem.id,
          title: existyingCartitem.title,
          price: existyingCartitem.price,
          quantity: existyingCartitem.quantity - 1,
          productid: existyingCartitem.productid,
        ),
      );
    } else {
      _items.remove(Productid);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void addItem(String productid, String title, double price) {
    if (_items.containsKey(productid)) {
      _items.update(
          productid,
          (existingcartItem) => CartItem(
                title: existingcartItem.title,
                productid: existingcartItem.productid,
                price: existingcartItem.price,
                id: existingcartItem.id,
                quantity: existingcartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
        productid,
        () => CartItem(
          id: DateTime.now().toString(),
          productid: productid,
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}

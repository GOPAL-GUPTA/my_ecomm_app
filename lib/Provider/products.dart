import 'package:flutter/material.dart';

import 'package:grk_001/Provider/product.dart';
import 'package:grk_001/models/httpexception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  String userid;

  List<String> Loadedproduct = [];
  List<Product> _Mostpopularproduct = [];
  Products(this.userid);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get FavouriteItems {
    return _items.where((prod) => prod.isFavourite == true).toList();
  }

  Product findByid(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addproduct(Product product) async {
    const Url = 'https://grk001-49ab4.firebaseio.com/products.json';

    try {
      final response = await http.post(
        Url,
        body: json.encode({
          'categories': product.categories,
          'title': product.title,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'description': product.description,
          'isFavourite': product.isFavourite,
        }),
      );

      final newproduct = Product(
        id: json.decode(response.body)['name'],
        categories: product.categories,
        title: product.title,
        price: product.price,
        imageUrl: product.imageUrl,
        description: product.description,
      );
      _items.add(newproduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchandsetproduct() async {
    const Url = 'https://grk001-49ab4.firebaseio.com/products.json';

    try {
      final response = await http.get(Url);
      final extractdata = jsonDecode(response.body) as Map<String, dynamic>;
      if (extractdata == null) {
        return;
      }
      final List<Product> LoadedProduct = [];
      extractdata.forEach((prodId, proddata) {
        LoadedProduct.add(Product(
          id: prodId,
          categories: proddata['categories'],
          price: proddata['price'],
          title: proddata["title"],
          description: proddata['description'],
          imageUrl: proddata['imageUrl'],
          isFavourite: proddata['isFavourite'],
        ));
      });
      _items = LoadedProduct;
      notifyListeners();
    } catch (error) {
      print(error);
//      throw (error);
    }
  }

  Future<void> updateProduct(String id, Product newproduct) async {
    final prodindex = _items.indexWhere((prod) => prod.id == id);
    if (prodindex >= 0) {
      final Url = 'https://grk001-49ab4.firebaseio.com/products/$id.json';
      await http.patch(
        Url,
        body: json.encode({
          'categories': newproduct.categories,
          'title': newproduct.title,
          'price': newproduct.price,
          'imageUrl': newproduct.imageUrl,
          'description': newproduct.description,
        }),
      );
      _items[prodindex] = newproduct;
      notifyListeners();
    } else
      print('...');
  }

//  void main() {
//    bool isNumber(String item) {
//      return '0123456789'.split('').contains(item);
//    }
//
//    String Product = _items.last.id;
//    var a = Product.split('');
//    a.removeWhere((item) => !isNumber(item));
//    print(a);
//  }
  List<Product> _items = [
//    Product(
//      id: '1',
//      categories: 'AC1, AC2, AC3, N1, Pn1, P',
//      title: 'Red Shirt',
//      description: 'A red shirt - it is pretty red!',
//      price: 29.99,
//      imageUrl:
//          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//    ),
//    Product(
//      categories:' pn2, N2, N3, Pn2, Pn3',
//      id: '2',
//      title: 'Trousers',
//      description: 'A nice pair of trousers.',
//      price: 59.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//    ),
//    Product(
//      categories: 'N4, N5, Pn4, Pn5, HM1, HM2',
//      id: '3',
//      title: 'Yellow Scarf',
//      description: 'Warm and cozy - exactly what you need for the winter.',
//      price: 19.99,
//      imageUrl:
//          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//    ),
//    Product(
//      categories:
//       ' N4,N5,N6,Pn4,Pn5,Pn6,Pn7, Pn8, Pn9, Pn10, HM1,HM2',
//      id: '4',
//      title: 'A Pan',
//      description: 'Prepare any meal you want.',
//      price: 49.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//    ),
  ];

  void deleteProduct(String id) async {
    final Url = 'https://grk001-49ab4.firebaseio.com/products/$id.json';
    final existingproductindex = _items.indexWhere((prod) => prod.id == id);
    var existingproduct = _items[existingproductindex];
    _items.removeAt(existingproductindex);
    notifyListeners();
    final response = await http.delete(Url);
    if (response.statusCode >= 400) {
      _items.insert(existingproductindex, existingproduct);
      notifyListeners();
      throw HttpException('could not delete product');
    }
    existingproduct = null;
  }

  Future<void> fetchcategoriesproduct() async {
    try {
      const Url = 'https://grk001-49ab4.firebaseio.com/please.json';
      final response = await http.get(Url);

      final extractdata = jsonDecode(response.body) as List<dynamic>;
      if (extractdata == null) {
        return;
      }
      extractdata.map((item) {
        Loadedproduct.add(item['id']);
      }).toList();
//      List<Product> foundProducts = [];
      _Mostpopularproduct =
          _items.where((p) => Loadedproduct.contains(p.id)).toList();
      notifyListeners();
      print(Loadedproduct);
    } catch (error) {
      print(error);
    }
  }

  List<Product> get MostpopularProduct {
    return [..._Mostpopularproduct];
  }

 List<String>  getsuggestions(String query) {
    List<String > matches = [];
//    matches = _items;
//    notifyListeners();
     _items.map((e) => matches.add(e.title)).toList();
    matches.retainWhere(
        (element) => element.toLowerCase().contains(query.toLowerCase()));
    notifyListeners();
    print(matches);
    return matches;
  }
}

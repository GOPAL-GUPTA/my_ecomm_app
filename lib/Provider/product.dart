import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class Product with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  FirebaseUser _Loggedinuser;
  String _userid;
  FirebaseUser get Loggedinuser {
    return _Loggedinuser;
  }

  String get userid {
    return _userid;
  }
  final String id;
  final String title;
  final String categories;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;
  Product({
    this.categories,
    this.title,
    this.id,
    this.imageUrl,
    this.description,
    this.price,
    this.isFavourite = false,
  });
  void setfav(bool newstatus) {
    isFavourite = newstatus;
    notifyListeners();
  }

  void toggleisFavourite() async {
    final Url = 'https://grk001-49ab4.firebaseio.com/products/$id.json';
    final oldstatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    try {
      final response = await http.patch(
        Url,
        body: json.encode(
          {
            'isFavourite': isFavourite,
          },
        ),
      );
      if (response.statusCode >= 400) {
        setfav(oldstatus);
      }
    } catch (error) {
      setfav(oldstatus);
    }
  }

  Future<void> getcurrentuser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        _Loggedinuser = user;
        _userid = _Loggedinuser.uid;
        notifyListeners();
        print(_Loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  FirebaseUser _Loggedinuser;
  String _userid;
  FirebaseUser get Loggedinuser {
    return _Loggedinuser;
  }

  String get userid {
    return _userid;
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

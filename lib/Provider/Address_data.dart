
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:grk_001/models/Address_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressData extends ChangeNotifier {
  final String userid;
  AddressData(this.userid, this.Addresses);
  List<AddressType> Addresses = [];
  void AddAddress(
    String name,
    String address1,
    String address2,
    String city,
    String state,
    String pincode,
    String phoneno,
    String Landmark,
    String radiovalue,
  ) async {
    final AddressType new_adress = AddressType(
      name: name,
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      pincode: pincode,
      phoneno: phoneno,
      landmark: Landmark,
      radiovalue: radiovalue,
    );

    await Firestore.instance
        .collection('user')
        .document('$userid')
        .collection('Addresses')
        .document('$userid')
        .setData({
      'Address': name +
          address1 +
          address2 +
          Landmark +
          city +
          state +
          pincode +
          radiovalue +
          phoneno
    });

    Addresses.add(new_adress);
    notifyListeners();
  }

  void deleteaddresses(AddressType Address) {
    Addresses.remove(Address);
    notifyListeners();
  }

  int get Addresseslength {
    return Addresses.length;
  }
}

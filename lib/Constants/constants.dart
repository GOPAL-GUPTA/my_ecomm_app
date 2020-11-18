import 'package:flutter/material.dart';

const khomescreendivider = Divider(
  color: Colors.orange,
  thickness: 5,
);

const ktextfielddecoration2 = InputDecoration(
  labelText: 'Enter a value',
  labelStyle: TextStyle(color: Color(0xffff4081)),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0XFFFF4081),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlue,
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0XFFFF4081),
    ),
  ),
);
const ktextfielddecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(color: Colors.black, width: 2.0)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(color: Colors.black, width: 1.0)),
);
const kaddressfielddecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 1.0),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange, width: 1.0),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
  ),
  disabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.yellowAccent, width: 1.0),
  ),
  filled: true,
  fillColor: Colors.white,
  labelText: 'Enter a value',
  labelStyle: TextStyle(color: Colors.black54, fontSize: 20.0),
);
const PAYMENT_URL =
    "http://10.0.2.2:5000/grk001-49ab4/us-central1/customFunctions/payment";
const ORDER_DATA = {

  "custID": "USER_111111111111",
  "custEmail": "someemail@gmail.com",
  "custPhone": "7777777777",
  "orderID":"123456789"
};
const STATUS_LOADING = "PAYMENT_LOADING";
const STATUS_SUCCESSFUL = "PAYMENT_SUCCESSFUL";
const STATUS_PENDING = "PAYMENT_PENDING";
const STATUS_FAILED = "PAYMENT_FAILED";
const STATUS_CHECKSUM_FAILED = "PAYMENT_CHECKSUM_FAILED";

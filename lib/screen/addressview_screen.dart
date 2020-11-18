import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grk_001/screen/addnew_addressscreen.dart';
import 'package:grk_001/widgets/Address_list.dart';

class AddressView extends StatelessWidget {
  static const String routename = 'AddressView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Addresses'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: double.infinity,
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AddNewAddreesScreen.routename);
              },
              elevation: 5.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '+   Add a new address',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          AddressList(),
        ],
      ),
    );
  }
}

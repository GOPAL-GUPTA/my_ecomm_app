import 'package:flutter/material.dart';
import 'package:grk_001/Buttons/dropdownbutton.dart';
import 'package:grk_001/Provider/Address_data.dart';
import 'package:provider/provider.dart';
import 'package:grk_001/Constants/constants.dart';


class AddNewAddreesScreen extends StatefulWidget {
  static const String routename = 'AddAddressscreen';

  @override
  _AddNewAddreesScreenState createState() => _AddNewAddreesScreenState();
}

class _AddNewAddreesScreenState extends State<AddNewAddreesScreen> {
  final pincodecont = TextEditingController();
  final landmarkcont = TextEditingController();
  final address1cont = TextEditingController();
  final address2cont = TextEditingController();
  final citycont = TextEditingController();
  final alternatecont = TextEditingController();
  final namecont = TextEditingController();
  final phonecont = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  String selectedstate;
  void setselectedstate(String select) {
    selectedstate = select;
  }

  AddressData address_data;
  String Radiovalue = '';
  void submit() {
    final isvalid = _form.currentState.validate();
    if (isvalid) {
      _form.currentState.save();
      address_data.AddAddress(
        namecont.text,
        address1cont.text,
        address2cont.text,
        citycont.text,
        selectedstate,
        pincodecont.text,
        phonecont.text,
        landmarkcont.text,
        Radiovalue,
      );

      Navigator.of(context).pop();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    address_data = Provider.of<AddressData>(context);
    final devicesize = MediaQuery.of(context).size;
    final appcolor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('AddNewAddressScreen'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: devicesize.height * 0.10,
                      width: devicesize.width,
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.gps_fixed,
                              color: appcolor,
                              size: 30.0,
                            ),
                            Text(
                              ' Use my current location',
                              style: TextStyle(color: appcolor, fontSize: 20.0),
                            )
                          ],
                        ),
                        color: Colors.white,
                        splashColor: appcolor,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Tap to auto fill the address field',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.1,
                  color: Colors.black54,
                ),
                TextFormField(
                  controller: pincodecont,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Please Enter pin Code');
                    }
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  enabled: true,
                  style: TextStyle(color: Colors.black87, fontSize: 20.0),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration:
                      kaddressfielddecoration.copyWith(labelText: 'Pin Code*'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: address1cont,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Please Enter Flat,House No,Building,Company,Village');
                    }
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  maxLines: 2,
                  enabled: true,
                  style: TextStyle(color: Colors.black87, fontSize: 20.0),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: kaddressfielddecoration.copyWith(
                      labelText: 'Flat,House No,Building,Company,Village*'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: address2cont,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return ('Please Enter Area,Colony,Street,Sector,Village ');
                      }
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    maxLines: 2,
                    enabled: true,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: kaddressfielddecoration.copyWith(
                        labelText: 'Area,Colony,Street,Sector,Village*')),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: citycont,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Please Enter City');
                    }
                  },
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  enabled: true,
                  style: TextStyle(color: Colors.black87, fontSize: 20.0),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration:
                      kaddressfielddecoration.copyWith(labelText: 'City*'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.black26),
                    ),
                  ),
                  child: DropButton(setselectedstate),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: landmarkcont,
                    // ignore: missing_return
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    maxLines: 2,
                    enabled: true,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: kaddressfielddecoration.copyWith(
                        labelText: 'Landmark(Optional)')),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: namecont,
//                     ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return ('Please Enter Name');
                      }
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    maxLines: 1,
                    enabled: true,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: kaddressfielddecoration.copyWith(
                        labelText: 'Full Name')),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: phonecont,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty ||
                          value.length < 10 ||
                          value.length > 10) {
                        return ('Please Enter Phone no.');
                      }
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    maxLines: 1,
                    enabled: true,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: kaddressfielddecoration.copyWith(
                        labelText: 'Phone no.')),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: alternatecont,
                    // ignore: missing_return
                    onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    maxLines: 1,
                    enabled: true,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: kaddressfielddecoration.copyWith(
                        labelText: 'Alternate phone no.(Optional)')),
                const SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black54,
                ),
                Text(
                  'Address type',
                  style: TextStyle(color: Colors.black54),
                ),
                buildRadioListTile('Home', 'Home Address'),
                buildRadioListTile('Office', 'Work/Office Address'),
                RaisedButton(
                  child: Text(
                    'Save',
                  ),
                  onPressed: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RadioListTile<String> buildRadioListTile(String Value, String title) {
    return RadioListTile(
//                  selected: true,
      activeColor: Colors.red,
      onChanged: (val) {
        setState(() {
          Radiovalue = val;
        });
      },
      value: Value,
      title: Text(title),
      groupValue: Radiovalue,
    );
  }
}

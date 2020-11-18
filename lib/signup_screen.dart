

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grk_001/Constants/constants.dart';
import 'package:grk_001/Buttons/bottom_raised_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignupScreen extends StatefulWidget {
  static const String routename = 'signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String confirmpassword;
  String name;
  String phone;
  bool showspinner = false;
  bool showpassword = true;
  bool showconfirmpassword = true;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  FocusNode passwordfocusnode;
  FocusNode confirmpasswrdnode;
  void trysubmit() async {
    final isvalid = _form.currentState.validate();
    if (isvalid) {
      _form.currentState.save();
      FocusScope.of(context).unfocus();
      setState(() {
        showspinner = true;
      });
    }
    try {
      final newuser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newuser != null) {
        Navigator.pop(context);
        await Firestore.instance
            .collection('user')
            .document(newuser.user.uid)
            .collection('profile')
            .document(newuser.user.uid)
            .setData(
          {
            'Name': name,
            'Email': email,
            'Phone': phone,
          },
        );
      }
      setState(() {
        showspinner = false;
      });
    } on PlatformException catch (e) {
      setState(() {
        showspinner = false;
      });
      var message = ' An error occured,Please check your credentials';
      if (e.message != null) {
        message = e.message;
      }
      scaffoldkey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordfocusnode = FocusNode();
    confirmpasswrdnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordfocusnode.dispose();
    confirmpasswrdnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          title: Text('Signup screen'),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset('images/grbimage.jpg',
                        height: devicesize.height * 0.30,
                        width: devicesize.width * 0.50),
                  ),
                  Form(
                    key: _form,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: namecontroller,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty || value.length < 4) {
                                return ("please Enter a valid name");
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            decoration: ktextfielddecoration.copyWith(
                              hintText: ' Enter Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            onSaved: (value) {
                              name = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return ('please Enter a valid email id');
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            keyboardType: TextInputType.emailAddress,
                            decoration: ktextfielddecoration.copyWith(
                              hintText: ' Enter Email id',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                            ),
                            onSaved: (value) {
                              email = value.trim();
                            },
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty ||
                                  value.length > 10 ||
                                  value.length < 10) {
                                return ('please Enter valid phone no.');
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            keyboardType: TextInputType.phone,
                            decoration: ktextfielddecoration.copyWith(
                              hintText: ' Enter Phone.No.',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                            onSaved: (value) {
                              phone = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: passcontroller,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty || value.length < 6) {
                                return ('please Enter valid  password');
                              }
                              return null;
                            },
                            focusNode: passwordfocusnode,
                            onTap: () => setState(() {
                              passwordfocusnode.requestFocus();
                            }),
                            autocorrect: false,
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            obscureText: !passwordfocusnode.hasFocus,
                            decoration: ktextfielddecoration.copyWith(
                              hintText: ' Enter password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            onSaved: (value) {
                              password = value;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              confirmpassword = value;
                            },
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) {
                                return ('please Enter confirm password');
                              }
                              if (passcontroller.text != value) {
                                return ('Password does not match');
                              }
                              return null;
                            },
                            onTap: () => setState(() {
                              FocusScope.of(context).unfocus();
//                            FocusScope.of(context)
//                                .requestFocus(confirmpasswrdnode);//   FocusScope.of(context).unfocus();its also written as;
                              confirmpasswrdnode.requestFocus();
                            }),
                            autocorrect: false,
                            style: TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            obscureText: showconfirmpassword,
                            decoration: ktextfielddecoration.copyWith(
                              hintText: 'Confirm Password',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  showconfirmpassword = !showconfirmpassword;
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: showconfirmpassword
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BottomRaisedbutton(
                    text: 'Sign Up >>',
                    onpressed: trysubmit,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

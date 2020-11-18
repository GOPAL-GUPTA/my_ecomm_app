import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grk_001/Constants/constants.dart';
import 'package:grk_001/Buttons/bottom_raised_button.dart';
import 'package:grk_001/homescreen.dart';
import 'package:grk_001/signup_screen.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogIn extends StatefulWidget {
  static const String routename = 'login';
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool showpassword = false;
  bool showspinner = false;
  void passwordvisibility() {
    setState(() {
      showpassword = !showpassword;
    });
  }

  void trysubmit() async {
    final isvalid = _form.currentState.validate();
    if (isvalid) {
      FocusScope.of(context).unfocus();
      _form.currentState.save();
      setState(() {
        showspinner = true;
      });
    }
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        print(email);
        Navigator.pushNamed(context, HomeScreen.routename);
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
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            title: Text('LogIn_Screen'),
          ),
          body: ModalProgressHUD(
            inAsyncCall: showspinner,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset('images/grbimage.jpg',
                        height: devicesize.height * 0.40,
                        width: devicesize.width * 0.70),
                  ),
                ),
                Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty || !value.contains('@')) {
                              return ('please enter a valid email address');
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          style: Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: ktextfielddecoration.copyWith(
                              hintText: 'Enter Email id or phone no.'),
                          onSaved: (value) {
                            email = value.trim();
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              return ('please enter password');
                            }
                            return null;
                          },
                          autocorrect: false,
                          obscureText: !showpassword,
                          style: Theme.of(context).textTheme.bodyText1,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) =>
                              FocusScope.of(context).nextFocus(),
                          keyboardType: TextInputType.emailAddress,
                          decoration: ktextfielddecoration.copyWith(
                            hintText: 'password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                passwordvisibility();
                                FocusScope.of(context).requestFocus(
                                    FocusNode()); //KEYBOARD SHUT DOWN
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: showpassword ? Colors.red : Colors.black,
                              ),
                            ),
                          ),
                          onSaved: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          children: <Widget>[
                            BottomRaisedbutton(
                              text: 'Log In >>',
                              onpressed: trysubmit,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SignupScreen.routename);
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

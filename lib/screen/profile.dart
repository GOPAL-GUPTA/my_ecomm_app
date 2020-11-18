import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grk_001/Picker/userimage_picker.dart';

class MyProfile extends StatefulWidget {
  static const String routename = 'Myprofile';
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String imageUrl;
  FirebaseUser userid;
  BuildContext ctx;
  final firestore = Firestore.instance;

  @override
//  void getProfile() async {
//    await firestore
//        .collection('user/21dUG5239HhJC6qF5TQn/profile')
//        .snapshots()
//        .listen((event) {
//      name = event.documents[0]['Name'];
//      email = event.documents[0]['Phone'];
//      phoneNo = event.documents[0]['Email'];
//    });
//  }
//async {
//    final profile = await firestore.collection('user').getDocuments();
//    for (var message in profile.documents) {
//      print(message.data);
//    }
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    getProfile();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    userid = ModalRoute.of(context).settings.arguments as FirebaseUser;
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: devicesize.height * 0.35,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: StreamBuilder(
                stream: firestore
                    .collection('user/${userid.uid}/profile')
                    .snapshots(),
                builder: (context, streamsnapshot) {
                  if (streamsnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final documents = streamsnapshot.data.documents;
                  imageUrl = documents[0]['imageUrl'];
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      UserimagePicker(ctx, userid, imageUrl),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        documents[0]['Name'], //take from sign up screen
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        documents[0]['Phone'], //take from sign up screen
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        documents[0]['Email'], //take from sign up screen
                        style: TextStyle(
                          fontSize: 20.00,
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Column(
              children: <Widget>[
                Myprofilecontainer(),
                Myprofilecontainer(),
                Myprofilecontainer(),
                Myprofilecontainer(),
                Myprofilecontainer(),
                Myprofilecontainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Myprofilecontainer extends StatelessWidget {
  const Myprofilecontainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        child: RaisedButton(
          onPressed: () {},
          splashColor: Color(0XFFFF4081),
          color: Colors.white,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
